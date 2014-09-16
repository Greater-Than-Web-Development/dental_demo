class Booking < ActiveRecord::Base

  belongs_to :time_slot
  belongs_to :chair
  belongs_to :appointment

  # One appointment can't be made twice for the same time_slot
  validates_uniqueness_of :appointment_id, { scope: :time_slot_id, message: "The same appointment can't be made twice for the same time slot." }

  # Two bookings can't have the same chair if they have the same time
  validates_uniqueness_of :chair_id, { scope: :time_slot_id, message: "Multiple appointments can't be book for the same chair, at the same time." }

  validates_presence_of :chair
  # A time_slot can have a maximum of 1 booking for appointment.of_type = "major"


  def validate_available

    appointment = self.appointment
    time_slot = self.time_slot

    if appointment.major?
      unless time_slot.totally_clear?
        record.errors[:base] << "Time slot needs to have 0 bookings before an appointment of type 'major' can be booked."
      end
    end

    if appointment.minor?
      if time_slot.booked?
        record.errors[:base] << "Time already booked. Time slot needs to have 0 or 1 bookings before an appointment of type 'minor' can be booked."
      end
    end

  end


end
