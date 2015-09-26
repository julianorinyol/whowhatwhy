class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :hangouts_users
  has_and_belongs_to_many :hangouts
  has_many :events
  has_many :calendars

  def get_calendars
    uri = URI.parse('https://www.googleapis.com/calendar/v3/users/me/calendarList')
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    req = Net::HTTP::Get.new(uri.path, initheader = {'Authorization' => 'Bearer ' + google_auth_token,'Content-Type' =>'application/json'})
    res = https.request(req)
    body = JSON.parse(res.body)
    # old_calendars = Calendar.where(user_id: id)
    # binding.pry
    body['items'].each do |calendar|
      cal = Calendar.where(primary: !!calendar['primary'], google_id: calendar['id'], summary: calendar['summary'], user_id: id ).first_or_create
      cal.get_events
    end
  end
  # create_table "calendars", force: :cascade do |t|
  #   t.boolean  "primary"
  #   t.string   "google_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string   "summary"
  # end
  

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end

# require 'net/http'

# url = URI.parse('http://www.example.com/index.html')
# req = Net::HTTP::Get.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
#   http.request(req)
# }
# puts res.body

# uri = URI.parse("https:/...")
# https = Net::HTTP.new(uri.host,uri.port)
# https.use_ssl = true
# req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
# req['foo'] = 'bar'
# req.body = "[ #{@toSend} ]"
# res = https.request(req)
# puts "Response #{res.code} #{res.message}: #{res.body}"