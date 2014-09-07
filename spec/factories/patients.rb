# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

pwid_values = (1..10).to_a

FactoryGirl.define do
  factory :patient do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password "password1"
    birthday {Time.at(rand * Time.now.to_i - 18.years)}
    new {[1,2][rand 2]}
    phone "MyString"
    address "MyText"
    pwid {pwid_values.slice!(0)}
  end
end
