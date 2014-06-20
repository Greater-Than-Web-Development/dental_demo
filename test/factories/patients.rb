# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    phone "MyString"
    date_of_birth "2014-06-20"
  end
end
