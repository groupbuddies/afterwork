# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

events = Event.create([ {name: 'Ruby-cenas', location: 'Braga', start_date: DateTime.new(2015,03,10,20,30), end_date: DateTime.new(2015,03,10,22,30), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse magnam veniam illo voluptatum distinctio, quam enim dolore, ipsa et debitis.', hashtag: '#rubycenas', owner: 1},
                        {name: 'Javascript-cenas', location: 'Braga', start_date: DateTime.new(2015,03,10,20,00), end_date: DateTime.new(2015,03,10,21,30), description: 'Temporibus, obcaecati aliquam esse magnam veniam illo voluptatum distinctio, quam enim dolore, ipsa et debitis.', hashtag: '#javascipt-cenas', owner: 1},
                        {name: 'Web-development-cenas', location: 'Braga', start_date: DateTime.new(2015,03,10,20,30), end_date: DateTime.new(2015,03,10,22,30), description: 'Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse magnam veniam illo voluptatum distinctio, quam enim dolor.', hashtag: '#web-cenas', owner: 1},
                        {name: 'YEY', location: 'Braga', start_date: DateTime.new(2015,03,10,20,30), end_date: DateTime.new(2015,03,10,22,30), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse magnam veniam illo voluptatum distinctio, quam enim dolore, ipsa et debitis.', hashtag: '#YEY', owner: 1}])
