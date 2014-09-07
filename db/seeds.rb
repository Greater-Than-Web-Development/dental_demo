
# Uncomment to run Sprig seed files
# path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
# load path if File.exist?(path)
# puts "Running Sprig seed files

puts "Running db/seeds.rb"

pwid_values = (1..10).to_a

puts "Seeding chairs into database."

["room one", "room two"].each do |room|
  Chair.find_or_create_by(room: room) do |chair|
    chair.booked: [true,false][rand(2)]
  end
end

puts "Seeding AdminUser account."

AdminUser.create! do |a|
  a.email = ENV[ADMIN_EMAIL_DEVELOPMENT]
  a.password = ENV[ADMIN_PASSWORD_DEVELOPMENT]
end

puts "Seeding first patient."

Patient.create! do |p|
  p.email = ENV[PATIENT_EMAIL_DEVELOPMENT]
  p.password = ENV[PATIENT_PASSWORD_DEVELOPMENT]
end

puts "Seeding 10 more patients."

10.times do

  Patient.create
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password1",
    birthday: rand(19..50).years.ago.strftime('%m/%d/%Y'),
    new_patient: [true,false][rand 2],
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    zip: Faker::Address.zip,
    pwid: pwid_values.slice!(0),
    city: Faker::Address.city
end

puts "Seeding time slots."

TimeSlot.create do |t|
  t.start_time = "2014-09-01 19:18:02"
  t.end_time = "2014-09-01 19:18:02"
  t.date = "2014-09-01"
  t.availability = true
end
