class Appointment < ActiveRecord::Base
  belongs_to :hygienist
  belongs_to :dentist
  belongs_to :time_slot
  belongs_to :chair
  belongs_to :patient
end
