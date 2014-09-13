class Booking < ActiveRecord::Base

  belongs_to :time_slot
  belongs_to :appointment, -> { includes :chair }

  #one appointment can't be made twice for the same time_slot
  validates_uniqueness_of :appointment_id, scope: :time_slot_id


  def chair_open
  # two bookings for the same time slot can't be made for the same chair
  #   if
  #   self.appointment.chair_id == chair_id && self.time_slot_id == time_slot_id

  end

end
