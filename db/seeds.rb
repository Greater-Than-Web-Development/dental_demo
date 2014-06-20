# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do

Patient.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, password: Faker::Internet.password)

end

10.times do

Appointment.create(patient_id: Faker::Number.digit, chair_id: Faker::Number.digit, date:rand(10.years).ago, time: rand(10.minutes).ago.time, confirmation_sent: ["true","false"].sample, confirmed: "false")

end

20.times do

AppointmentRequest.create(patient_id: Faker::Number.digit, chair_id: Faker::Number.digit, date:rand(10.years).ago, time: rand(10.minutes).ago.time, request_read: "false", morning: ["true","false"].sample)

end