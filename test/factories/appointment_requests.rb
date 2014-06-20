# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment_request do
    patient_id 1
    date "2014-06-20"
    time "2014-06-20 04:37:02"
    morning? false
    appointment_type "MyString"
    request_read? false
  end
end
