class Group < ActiveRecord::Base
  has_many :users, through: :groups_users
  belongs_to :user
end
