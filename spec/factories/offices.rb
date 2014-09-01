# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office do
    name "MyString"
    address "MyText"
    phone "MyString"
    fax "MyString"
  end
end
