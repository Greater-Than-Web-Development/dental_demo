class Appointment < ActiveRecord::Base
  attr_accessible :appointment_type, :chair_id, :confirmation_sent, :confirmed, :date, :end_time, :patient_id, :start_time

  # Associations
  belongs_to :patient
  belongs_to :chair

  # Validations
  validates_time :start_time, :between => '9:00am'...'5:00pm' # On or after 9:00AM and strictly before 5:00PM
  validates_time :end_time, :after => :start_time
  validates_date :date, :on => :create, :on_or_after => :today



  def self.started_before(time)
    where("start_time < ?", time)
  end

  def format_time
    self.strftime "%H:%M "
  end

  def appointment_length
    TimeDifference.between(self.start_time, self.end_time).in_hours
  end

  def self.list_all_on(date)
   find_by(date: date)
 end

 def check_and_set_end_time
  if self.end_time == nil && self.type != nil
    self.set_end_time_by(self.type)
  else
    false
  end
end

  #Todo, define appointment types

  def set_end_time_by(params_type)
    formatted_type = params_type.downcase
    appointment_types = {"check_up" => 1, "cleaning" => 1, "whitening" => 2, "surgery" => 3, "filling" => 1.5 }
    if appointment_types.include?(formatted_type)
      new_end_time = appointment_types[formatted_type]
      self.update(end_time: self.start_time + new_end_time.hours)
    else
      return false
    end
  end

  def self.find_apps(requested_time, date)

   list_all_on(date).order(ABS(start_time - requested_time)).first

 end

 # Check if a given appointment overlaps this appointment

 def overlaps?(other)
  (self.start_time - other.end_time) * (other.start_time - self.end_time) >= 0
end

  # def self.open_times(params_date)
  #   find_by(date: params_date)
  # end

  def start_time_conflict?(start_time_string, end_time_string)
    self.start_time.between?(Time.zone.parse(start_time_string), Time.zone.parse(end_time_string))
  end

  def end_time_conflict?(start_time_string, end_time_string)
    self.end_time.between?(Time.zone.parse(end_time_string), Time.zone.parse(end_time_string))
  end



# # Return a scope for all appointment overlapping the given appointment, including the given appointment itself
# named_scope :overlapping, lambda { |appointment| {:conditions => ["(DATEDIFF(start_time, ?) * DATEDIFF(?, end_time)) >= 0", appointment.end_time, appointment.start_time]}}


  # def available_times_for(weekday)

  # hours_in_day = [9:00, ]

  # self.strftime("%H:%M:%S")

  # end

end
