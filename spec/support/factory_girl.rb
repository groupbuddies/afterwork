require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  # factory :availability do
  #   week_day rand(0..6)
  #   start_time { Faker::Time.between(Time.now, 2.days.from_now, :evening }
  #   end_time start_time+rand(600..1200)
  # end
end
