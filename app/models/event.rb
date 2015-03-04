class Event < ActiveRecord::Base
  has_many :attendees, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
