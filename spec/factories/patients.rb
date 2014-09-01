# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password "MyString"
    birthday "MyString"
    new false
    phone "MyString"
    address "MyText"
    pwid 1
  end
end
