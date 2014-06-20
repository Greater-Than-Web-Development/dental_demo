class AppointmentRequest < ActiveRecord::Base
  attr_accessible :appointment_type, :date, :morning, :patient_id, :request_read, :time

  belongs_to :patient
end
