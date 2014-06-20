# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    patient_id 1
    chair_id 1
    date "2014-06-20"
    start_time "2014-06-20 04:41:25"
    end_time "2014-06-20 04:41:25"
    appointment_type "MyString"
    confirmation_sent? false
    confirmed? false
  end
end
