class Appointment < ActiveRecord::Base

  belongs_to :hygienist
  belongs_to :dentist
  belongs_to :patient
  has_many :bookings
  has_many :time_slots, through: :bookings

  # validates_uniqueness_of :chair_id, scope: :time_slot_id

end
