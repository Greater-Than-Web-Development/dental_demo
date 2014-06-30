class Appointment < ActiveRecord::Base
  attr_accessible :appointment_type, :chair_id, :confirmation_sent, :confirmed, :date, :end_time, :patient_id, :start_time

  belongs_to :patient
  belongs_to :chair

  def format_time
    self.strftime "%H:%M "
  end

  def appointment_length
  self.start_time - self.end_time
  end

  def slot_available?

  end


  # def available_times_for(weekday)

  # hours_in_day = [9:00, ]

  # self.find(:all, :conditions => { :date => weekday }

  # self.strftime("%H:%M:%S")

  # end

end
