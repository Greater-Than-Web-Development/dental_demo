# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    date "2014-09-01"
    doctor_id 1
    time_slot_id 1
    chair_id 1
    hygienist_id 1
    patient_id 1
    type ""
    patient_confirmed false
    confirmation_sent false
  end
end
