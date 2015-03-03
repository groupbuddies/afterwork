class Attendee < ActiveRecord::Base
  belongs_to :events
  belongs_to :users

  validates :event_id, presence: true
  validates :user_id, presence: true
end
