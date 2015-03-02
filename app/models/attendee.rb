class Attendee < ActiveRecord::Base
  belongs_to :events
  belongs_to :users

  validates :event, presence: true
  validates :user, presence: true
end
