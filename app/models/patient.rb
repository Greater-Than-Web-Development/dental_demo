class Patient < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :first_name, :last_name, :phone

  has_many :appointments
  has_many :appointment_requests
end
