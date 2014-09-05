class Dentist < ActiveRecord::Base
  has_many :appointments
end
