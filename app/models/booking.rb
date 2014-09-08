class Booking < ActiveRecord::Base

  belongs_to :time_slot
  belongs_to :appointment

end
