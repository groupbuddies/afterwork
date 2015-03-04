class Availability < ActiveRecord::Base
  belongs_to :user

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :user_id, presence: true

end
