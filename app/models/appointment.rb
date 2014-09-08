class Appointment < ActiveRecord::Base

  belongs_to :hygienist
  belongs_to :dentist
  belongs_to :chair
  belongs_to :patient
  has_many :bookings
  has_many :time_slots, through: :bookings

end
