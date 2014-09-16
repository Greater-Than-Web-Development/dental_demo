class Booking < ActiveRecord::Base

  belongs_to :time_slot
  belongs_to :chair
  belongs_to :appointment

  # One appointment can't be made twice for the same time_slot
  validates_uniqueness_of :appointment_id, { scope: :time_slot_id, message: "The same appointment can't be made twice for the same time slot." }

  # Two bookings can't have the same chair if they have the same time
  validates_uniqueness_of :chair_id, { scope: :time_slot_id, message: "Multiple appointments can't be book for the same chair, at the same time." }

  # A time_slot can have a maximum of 1 booking for appointment.of_type = "major"



  def validate_available

    appointment = self.appointment
    chair = self.chair
    time_slot = self.time_slot

  end


    # Appointment.where(of_type: "major").any?


end
