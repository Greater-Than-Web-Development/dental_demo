# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    date "2014-09-01"
    dentist_id 1
    hygienist_id 1
    patient_id 1
    of_type ""
    patient_confirmed false
    confirmation_sent false
  end
end
