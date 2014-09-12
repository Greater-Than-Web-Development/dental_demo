class WorkDay < ActiveRecord::Base
  extend AppointmentTools

  has_many :time_slots
  has_many :bookings, through: :time_slots

  # validate :business_day


end
