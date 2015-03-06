class Event < ActiveRecord::Base
  has_many :attendees, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  acts_as_taggable_on :interests

  after_create :notify_users

  # scope :today, lambda { :conditions => ["start_date = ?", Date.today] }

  def attending?(user_id)
    Attendee.find_by(user_id: user_id, event_id: id).nil? != false
  end

  def starting_date
    "#{start_date.strftime('%d/%m/%Y')} at #{start_date.strftime('%H:%M')}"
  end

  def ending_date
    event_ending_date = end_date
    "#{event_ending_date.strftime('%d/%m/%Y')} at #{event_ending_date.strftime('%H:%M')}"
  end

  def notify_users
    EventNotifications.perform_async(id)
  end

  def self.notify_users_available_todays
    Event.find_by(start_date: DateTime.now).each(&:users_available)
  end
end
