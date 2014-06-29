class Appointment < ActiveRecord::Base
  attr_accessible :appointment_type, :chair_id, :confirmation_sent, :confirmed, :date, :end_time, :patient_id, :start_time

  belongs_to :patient
  belongs_to :chair


  def available_times_for(weekday)

  hours_in_day = [9:00, ]

  self.find(:all, :conditions => { :date => weekday }

  self.strftime("%H:%M:%S")

  end

end
