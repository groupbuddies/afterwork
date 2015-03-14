# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
events = Event.create([ {
                          name: 'Ruby-cenas',
                          location: 'Braga',
                          start_date: DateTime.new(2015,03,10,20,30),
                          description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae explicabo ea
                                        praesentium non soluta suscipit temporibus, obcaecati aliquam esse magnam veniam
                                        illo voluptatum distinctio, quam enim dolore, ipsa et debitis.',
                          hashtag: '#rubycenas',
                          owner: 1
                        },
                        {
                          name: 'Javascript-cenas',
                          location: 'Braga',
                          start_date: DateTime.new(2015,03,10,20,28),
                          description: 'Temporibus, obcaecati aliquam esse magnam veniam illo voluptatum distinctio, quam
                          enim dolore, ipsa et debitis.',
                          hashtag: '#javascipt-cenas',
                          owner: 1
                        },
                        {
                          name: 'Web-Test-cenas',
                          location: 'Braga',
                          start_date: DateTime.new(2015,04,10,20,29),
                          description: 'Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse
                                        magnam veniam illo voluptatum distinctio, quam enim dolor.',
                          hashtag: '#web-cenas',
                          owner: 2
                        },
                        {
                          name: 'Web-Cenas-cenas',
                          location: 'Braga',
                          start_date: DateTime.new(2015,04,10,20,30),
                          description: 'Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse
                                        magnam veniam illo voluptatum distinctio, quam enim dolor.',
                          hashtag: '#web-cenas',
                          owner: 2
                        },
                        {
                          name: 'Web-RUBY-cenas',
                          location: 'Braga',
                          start_date: DateTime.new(2015,05,10,20,31),
                          description: 'Vitae explicabo ea praesentium non soluta suscipit temporibus, obcaecati aliquam esse
                                        magnam veniam illo voluptatum distinctio, quam enim dolor.',
                          hashtag: '#web-cenas',
                          owner: 2
                        },
                        {
                          name: 'YEY',
                          location: 'Braga',
                          start_date: DateTime.new(2015,05,10,20,32),
                          description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae explicabo ea praesentium
                                        non soluta suscipit temporibus, obcaecati aliquam esse magnam veniam illo voluptatum
                                        distinctio, quam enim dolore, ipsa et debitis.',
                          hashtag: '#YEY',
                          owner: 2}
                      ])

availabilities = Availability.create([{ week_day: 1, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 2, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 3, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 4, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 5, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 6, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 1},
                                      { week_day: 1, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},
                                      { week_day: 2, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},
                                      { week_day: 3, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},
                                      { week_day: 4, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},
                                      { week_day: 5, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},
                                      { week_day: 6, start_time: Time.new(2015,03,06,19,30), end_time: Time.new(2015,03,06,22,30), user_id: 2},])
