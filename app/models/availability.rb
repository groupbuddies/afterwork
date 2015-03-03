class Availability < ActiveRecord::Base
  WEEK_DAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  
  belongs_to :user

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true
end
