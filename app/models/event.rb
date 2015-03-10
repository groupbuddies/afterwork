class Event < ActiveRecord::Base
  has_many :attendances, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :start_date, presence: true

  acts_as_taggable_on :interests

  after_create :notify_users

  scope :future, -> { where('start_date >= ?', Time.now).order('start_date ASC') }

  def attending?(user_id)
    Attendance.find_by(user_id: user_id, event_id: id).present?
  end

  def starting_date
    "#{start_date.strftime('%d/%m/%Y')} at #{start_date.strftime('%H:%M')}"
  end

  def notify_users
    EventNotifications.perform_async(id)
  end

  def attend(user_id)
    Attendance.create(event_id: id, user_id: user_id) unless existing?(user_id)
  end

  def cancel(user_id)
    Attendance.where(user_id: user_id, event_id: id).first.destroy
  end

  private

  def existing?(user_id)
    Attendance.where(user_id: user_id, event_id: id).any?
  end
end
