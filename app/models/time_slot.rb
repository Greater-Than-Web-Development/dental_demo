class TimeSlot < ActiveRecord::Base

  validates_with :availability, unless: "appointments.nil?"
  # validates_with :workday

  has_many :appointments
  has_many :chairs, through: :appointments

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
