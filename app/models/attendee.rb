class Attendee < ActiveRecord::Base
  belongs_to :events
  belongs_to :users

  validates :event_id, presence: true
  validates :user_id, presence: true

  def self.attending?(user_id, event_id)
    Attendee.find_by(user_id: user_id, event_id: event_id).nil? != false
  end
end
