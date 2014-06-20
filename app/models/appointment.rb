class Appointment < ActiveRecord::Base
  attr_accessible :appointment_type, :chair_id, :confirmation_sent?, :confirmed?, :date, :end_time, :patient_id, :start_time
end
