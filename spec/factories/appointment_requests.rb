# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment_request do
    appointment_id 1
    date "2014-09-01"
    message "MyText"
    time "2014-09-01 19:47:22"
    time_of_day "MyString"
    request_read false
  end
end
