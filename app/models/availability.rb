class Availability < ActiveRecord::Base
  belongs_to :user

  WEEK_DAY = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true

  def hours
    "#{start_time.hour}:#{start_time.min}"
  end
end
