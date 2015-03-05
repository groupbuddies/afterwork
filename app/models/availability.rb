class Availability < ActiveRecord::Base
  belongs_to :user

  WEEK_DAY = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true

  def star_hours
    "#{start_time.hour}:#{start_time.min}"
  end

  def end_hours
    "#{end_time.hour}:#{end_time.min}"
  end

  def event_available(start_date, end_date)
    start_time < start_date && end_time > end_date
  end
end
