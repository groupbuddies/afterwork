class User < ActiveRecord::Base
  has_many :attendees
  has_many :availabilities

  validates :name, presence: true
end
