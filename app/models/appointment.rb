class Appointment < ActiveRecord::Base
  attr_accessible :appointment_type, :chair_id, :confirmation_sent, :confirmed, :date, :end_time, :patient_id, :start_time

  # Associations
  belongs_to :patient
  belongs_to :chair

  # Validations
  validates_time :start_time, :between => '9:00am'...'5:00pm' # On or after 9:00AM and strictly before 5:00PM
  validates_time :end_time, :after => :start_time
  validates_date :date, :on => :create, :on_or_after => :today

  def return_pretty_day_and_time
    self.start_time.strftime("%A at %l:%M%P")
  end

  def self.return_pretty_day_and_times(id=:all)
    find(id).map{|a| a.start_time.strftime("%A at %l:%M%P")}
  end

  def self.started_before(time)
    where("start_time < ?", time)
  end

  def return_12_time
    self.start_time.strftime "%l:%M "
  end

  def appointment_length_in_hours
    TimeDifference.between(self.start_time, self.end_time).in_hours
  end

  def all_available_times(time_start="9:00am")
    time = Time.parse(time_start)
    available_times = Array.new
    hours = 0
    16.times do
      hours + 0.5
      available_times << time + hours
    end
    return available_times
  end

  def self.available_times_for(given_date=Date.today)
    appointment_slots = all_available_times()
    appointments = where(date: given_date).pluck(:start_time, :end_time)
    ava
  end

  def self.list_all_on(input_date)
  # mm/dd/yy or dd-mm-yy or yyyy-mm-dd or yyyy/mm/dd
  if input_date.class() == String
    input_date = Date.parse(input_date)
  end
  where(date: input_date)
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


# find appointments scheduled closest to this time

 #  def self.find_closted_appointment(requested_time, date)

 #   list_all_on(date).order(ABS(:start_time - requested_time)).first

 # end

 # Check if a given appointment overlaps this appointment

 def overlaps?(other_appointment)
  (self.start_time - other_appointment.end_time) * (other_appointment.start_time - self.end_time) >= 0
end

def start_time_conflict?(start_time_string, end_time_string)
  self.start_time.between?(Time.zone.parse(start_time_string), Time.zone.parse(end_time_string))
end

def end_time_conflict?(start_time_string, end_time_string)
  self.end_time.between?(Time.zone.parse(end_time_string), Time.zone.parse(end_time_string))
end



# # Return a scope for all appointment overlapping the given appointment, including the given appointment itself
# named_scope :overlapping, lambda { |appointment| {:conditions => ["(DATEDIFF(start_time, ?) * DATEDIFF(?, end_time)) >= 0", appointment.end_time, appointment.start_time]}}


end
