class Chair < ActiveRecord::Base
  has_many :appointments
  belongs_to :office
  belongs_to :timeslot, through: :appointment
end
