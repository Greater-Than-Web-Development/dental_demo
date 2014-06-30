10.times do

  Patient.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, password: Faker::Internet.password)

end



Chair.create(name: "Room1")
Chair.create(name: "Room2")

time_array = []

20.times do
  time_array << Time.parse("9:00am") + rand(7).hours
end

end_at_array = []

i = 0

20.times do
  end_at_array << time_array[i] + 1.hour
  i + 1
end

end_at_array = [time_array[0] + 1.hour, time_array[1] + 2.hours, time_array[2] + 1.hour, time_array[3] + 1.hour]


20.times do
  AppointmentRequest.create(patient_id: Faker::Number.digit, date:rand(10.years).ago, time: rand(20.minutes).ago.time, request_read: "false", morning: ["true","false"].sample)
end

10.times do
  Appointment.create(patient_id: Faker::Number.digit, chair_id: [1, 2].sample, date:rand(10.years).ago, start_time: Time.parse("9:00am") + rand(7).hours, end_time: rand(10.minutes).ago.time, confirmation_sent: ["true","false"].sample, confirmed: "false")
end
