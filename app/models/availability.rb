class Availability < ActiveRecord::Base
  belongs_to :user

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true

  def start_hours
    "#{start_time.hour}:#{start_time.min}"
  end

  def end_hours
    "#{end_time.hour}:#{end_time.min}"
  end

  def include?(start_event_date)
    start_event_date.wday == week_day &&
      time_in_minutes(start_event_date) > time_in_minutes(start_time) &&
      time_in_minutes(start_event_date) < time_in_minutes(end_time)
  end

  private

  def time_in_minutes(date)
    date.hour * 60 + date.min
  end
end
