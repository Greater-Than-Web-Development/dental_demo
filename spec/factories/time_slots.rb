# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_slot do
    start_time "2014-09-01 19:18:02"
    end_time "2014-09-01 19:18:02"
    date "2014-09-01"
    work_day_id 1
    availability false
  end
end
