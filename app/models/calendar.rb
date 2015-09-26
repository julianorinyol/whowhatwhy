class Calendar < ActiveRecord::Base
  belongs_to :user
  has_many :events

  def get_events 
    uri = URI.parse('https://www.googleapis.com/calendar/v3/calendars/' + google_id + '/events')
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    req = Net::HTTP::Get.new(uri.path, initheader = {'Authorization' => 'Bearer ' + self.user.google_auth_token,'Content-Type' =>'application/json'})
    res = https.request(req)
    # body = JSON.parse([res.body].to_json).first
    if !(res.code == '404')
      body = JSON.parse(res.body, :quirks_mode => true)
      body['items'].each do |event|
        if !(event['status'] == 'cancelled')
          Event.where('start': event['start']['dateTime'], 'end': event['end']['dateTime'], user_id: self.user.id, calendar_id: id, from_google: true, title: event['summary'] ).first_or_create
        end
      end
    end
  end

 # create_table "events", force: :cascade do |t|
 #    t.datetime "start_time"
 #    t.datetime "end_time"
 #    t.integer  "user_id"
 #    t.boolean  "from_google"
 #    t.datetime "created_at",  null: false
 #    t.datetime "updated_at",  null: false
 #    t.string   "summary"
 #  end

end
