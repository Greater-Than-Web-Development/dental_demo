
# Uncomment to run Sprig seed files
# path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
# load path if File.exist?(path)
# puts "Running Sprig seed files

  puts "Running db/seeds.rb"

  pwid_values = (1..10).to_a

  puts "Seeding chairs into database."

  ["room one", "room two"].each do |room|
    Chair.find_or_create_by(room: room) do |chair|
      chair.booked = [true,false][rand(2)]
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

  5.times do
    WorkDay.create(start_time: WorkDay.time_slot_format(rand(9..17)), end_time: WorkDay.time_slot_format(rand(9..17)))
  end

  CalendarManager.new(workday: WorkDay.create(), date: WorkDay.date )

  puts "Seeding time slots."

  TimeSlot.create do |t|
    t.work_day_id =
    t.start_time = "2014-09-01 19:18:02"
    t.end_time = "2014-09-01 19:18:02"
    t.date = "2014-09-01"
    t.availability = true
  end
