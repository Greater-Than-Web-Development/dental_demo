10.times do

  Patient.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, password: Faker::Internet.password)

end



Chair.create(name: "Room1")
Chair.create(name: "Room2")


20.times do

  AppointmentRequest.create(patient_id: Faker::Number.digit, date:rand(10.years).ago, time: rand(20.minutes).ago.time, request_read: "false", morning: ["true","false"].sample)

end

10.times do

  Appointment.create(patient_id: Faker::Number.digit, chair_id: [1, 2].sample, date:rand(10.years).ago, start_time: rand(20.minutes).ago.time, end_time: rand(10.minutes).ago.time, confirmation_sent: ["true","false"].sample, confirmed: "false")

end
