class Hangout < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :activities
  belongs_to :group
end

