class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :start_date, :hashtag, :owner

  has_many :attendees
end
