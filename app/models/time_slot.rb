class TimeSlot < ActiveRecord::Base

  validates_with :availability, unless: "appointments.nil?"
  # validates_with :workday

  has_many :appointments
  belongs_to :office
  belongs_to :timeslot, through: :appointment

  def availability
    if self.chairs.count == 0
     self.booked? == false
   elsif self.chairs.count == 2
     self.booked? == true
   elsif self.chairs.count == 1 and self.appointment.type == "cleaning"
     self.booked? == false
   else
    self.booked? == true
  end

end
