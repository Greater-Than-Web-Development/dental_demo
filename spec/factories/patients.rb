# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

pwid_values = (1..10).to_a

FactoryGirl.define do
  factory :patient do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password "password1"
    birthday {rand(19..50).years.ago.strftime('%m/%d/%Y')}
    new_patient {[1,2][rand 2]}
    phone "MyString"
    address "MyText"
    pwid {pwid_values.slice!(0)}
  end
end
