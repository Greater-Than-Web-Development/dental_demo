# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    time_slot_id 1
    chair_id 1
    appointment_id 1
  end
end
