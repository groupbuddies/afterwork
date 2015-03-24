class EventSerializer < ActiveModel::Serializer
  attributes :name, :description, :location, :start_date, :hashtag, :owner

  has_many :attendees
end
