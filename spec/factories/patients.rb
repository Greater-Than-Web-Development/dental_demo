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
    new_patient {[true,false][rand 2]}
    phone {Faker::PhoneNumber.cell_phone}
    address {Faker::Address.street_address}
    zip {Faker::Address.zip}
    city {Faker::Address.city}
    pwid {pwid_values.slice!(0)}
  end
end
