class Booking < ActiveRecord::Base

  belongs_to :time_slot
  belongs_to :chair
  belongs_to :appointment, -> { includes :chair }

  #one appointment can't be made twice for the same time_slot
  validates_uniqueness_of :appointment_id, scope: :time_slot_id


  # def chair_open
  # # two bookings for the same time slot can't be made for the same chair
  #   chair_id = self.appointment.chair_id
  #   self.appointment.chair_id == chair_id && self.time_slot_id == time_slot_id

  #     if Booking.where(self.appointment.chaird_id) == chair_id
  #   errors.add(:appointment, "Can't have two bookings in same chair at same time")
  # end

  # end

end
