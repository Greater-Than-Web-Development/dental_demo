
# Uncomment to run Sprig seed files
# path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
# load path if File.exist?(path)
# puts "Running Sprig seed files

puts "Running db/seeds.rb"

puts "Seeding an office into database."

Office.create! do |office|
  office.name = "William Ryan DMD, LLC"
  office.address = "10 Hinsdale Avenue"
  office.zip = "06098"
  office.city = "Winsted"
  office.phone = "8603794382"
  office.fax = "8607384720"
end

puts "Seeding 1 dentist into database."

Dentist.create! do |dentist|
  dentist.first_name = "William"
  dentist.last_name = "Ryan"
end

puts "Seeding 2 hygienists into database."

Hygienist.create! do |h|
  h.first_name = Faker::Name.first_name
  h.last_name = Faker::Name.last_name
end

puts "Seeding chairs into database."

["room one", "room two"].each do |room|
  Chair.find_or_create_by(room: room) do |chair|
    chair.booked = false
  end
end

puts "Seeding AdminUser account."

AdminUser.create! do |a|
  a.email = ENV[ADMIN_EMAIL_DEVELOPMENT]
  a.password = ENV[ADMIN_PASSWORD_DEVELOPMENT]
end

puts "Seeding first patient."

Patient.create! do |p|
  p.first_name = "Ryan",
  p.last_name = "Kelley",
  p.email = ENV[PATIENT_EMAIL_DEVELOPMENT]
  p.password = ENV[PATIENT_PASSWORD_DEVELOPMENT]
  p.birthday = 26.years.ago.strftime('%m/%d/%Y')
  p.new_patient = false,
  p.phone = Faker::PhoneNumber.cell_phone,
  p.address = Faker::Address.street_address,
  p.zip = Faker::Address.zip,
  p.pwid = pwid_values.slice!(0),
  p.city = Faker::Address.city
end

puts "Seeding 10 more patients."
pwid_values = (1..10).to_a

10.times do

  Patient.create do |p|
    p.first_name = Faker::Name.first_name,
    p.last_name = Faker::Name.last_name,
    p.email = Faker::Internet.email,
    p.password = "password1",
    p.birthday = rand(19..50).years.ago.strftime('%m/%d/%Y'),
    p.new_patient = [true,false][rand 2],
    p.phone = Faker::PhoneNumber.cell_phone,
    p.address = Faker::Address.street_address,
    p.zip = Faker::Address.zip,
    p.pwid = pwid_values.slice!(0),
    p.city = Faker::Address.city
  end
end

puts "Seeding Workdays."

day_numbers = (1..5).to_a
5.times do
  start_time = WorkDay.time_slot_format(9)
  end_time = WorkDay.time_slot_format([5,6][rand(2)])
  rand_date = Date.today + day_numbers.slice!(0)
  WorkDay.create(start_time: start_time, end_time: end_time, date: rand_date )
end

puts "Generating Time Slots for each WorkDay"

workdays = WorkDay.all
workday_number = 1

workdays.each do |workday|
  calendar_manager = CalendarManager.new(workday: workday, date: workday.date)
  puts "Seeding time slots for workday no. #{workday_number}"
  workday_number += 1
  calendar_manager.generate_time_slots!
end

patients = Patient.all
rand_types = ["cleaning", "checkup", "filling"]

puts "Seeding one appointment per workday"

5.times do

  Appointment.create do |a|
    a.date = workdays[workday_number].date
    a.dentist_id = Dentist.first.id
    a.chair_id = Chair.first.id
    a.hygienist_id = Hygienist.first.id
    a.patient_id = patients.slice!(0)
    a.type = rand_types[rand(1..3)]
    a.patient_confirmed = false
    a.confirmation_sent = false
  end
  workday_number -= 1
end


