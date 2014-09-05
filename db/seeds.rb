# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["room one", "room two"].each do |room|
  Chair.find_or_create_by_room room
end

["room one", "room two"].each do |room|
  Chair.find_or_create_by_room room
end

AdminUser.create! do |a|
  a.email = ENV[ADMIN_EMAIL]
  a.password = ENV[ADMIN_PASSWORD] = 'password'
end

Patient.create! do |p|
  p.email = ENV[PATIENT_EMAIL]
  p.password = ENV[PATIENT_PASSWORD] = 'password'
end

10.times do

  Patient.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password, birthday: Time.at(rand * Time.now.to_i - 18.years), )

end
