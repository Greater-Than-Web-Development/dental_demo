class TimeSlot < ActiveRecord::Base

  # each appointment has many time_slots and each time_slot appears in many appointments

  validate :availability, unless: "appointments.nil?"

  has_many :bookings
  has_many :appointments, through: :bookings
  belongs_to :work_day

  def availability
    if self.chairs.count == 0
      self.booked = false
    elsif self.chairs.count == 2
      self.booked = true
    elsif self.chairs.count == 1 and self.appointment.type == "cleaning"
      self.booked = false
    else
      self.booked = true
    end
  end

end
