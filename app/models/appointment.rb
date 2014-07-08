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

  def self.all_available_times(time_input="9:00am", date_input=nil)
    time_min = Time.parse("#{date_input} #{time_input}")
    max_time = Time.parse("#{date_input} 5:00pm")
    available_times = Array.new
    hours = 0.5

    while time_min <= max_time do
      available_times << time_min
      time_min += hours.hours
    end

    return available_times
  end

  #generates all appointment blocks inside of appointment
  def appointment_range(start_time=self.start_time, end_time=self.end_time)
    step = 60*30 #1/2 hour
    app_range = Array.new
    while start_time <= end_time
      app_range << start_time
      start_time += step
    end
    return app_range
  end


  # Todo Create time slot manager class with these methods
  # note ActiveRecord 3.2.11 does not support pluck with multiple attributes

  # def self.available_times_for(given_date=Date.today)
  #   appointment_slots = all_available_times()
  #   # appointments = where(date: given_date).pluck(:start_time, :end_time)
  #   appointments = where(date: given_date).select([:start_time, :end_time]).map {|a| {start_time: a.start_time, end_time: a.end_time}}
  #   appointments.map do |appointment|
  #     if appointment[0] || appointment[1]
  #   end
  # end

  def self.scheduled_times_for(params_date=Date.today)
    where(date: params_date).select([:start_time, :end_time]).map{|a| {start_time: a.start_time, end_time: a.end_time}}
  end

  def self.available_times_for(given_date=Date.today)
    # if any available time is between scheduled start time and end time, remove from available array
    available_times = all_available_times("9:00am",given_date)
    #an array of hash objects
    scheduled_times = scheduled_times_for(given_date)
    closed_slots = Array.new

    available_times.each do |at|
      scheduled_times.each do |st|
        if at.hour.between?(st[:start_time].hour, st[:end_time].hour)
          closed_slots << at
        end
      end
    end
    return closed_slots
      # scheduled_times.each do |sched_hash|
      #   available_times.select{|at| !(at.between?(sched_hash.start_time, sched_hash.end_time))}
      # end
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

  #Move to module

  def next_appointments
    Appointment.find(:all, :limit => 1, :conditions => ["id > ? and patient_id = ?", self.id, self.patient_id])
  end


#  def overlaps?(other_appointment)
#   (self.start_time - other_appointment.end_time) * (other_appointment.start_time - self.end_time) >= 0
# end

# def start_time_conflict?(start_time_string, end_time_string)
#   self.start_time.between?(Time.zone.parse(start_time_string), Time.zone.parse(end_time_string))
# end

# def end_time_conflict?(start_time_string, end_time_string)
#   self.end_time.between?(Time.zone.parse(end_time_string), Time.zone.parse(end_time_string))
# end

# # Return a scope for all appointment overlapping the given appointment, including the given appointment itself
# named_scope :overlapping, lambda { |appointment| {:conditions => ["(DATEDIFF(start_time, ?) * DATEDIFF(?, end_time)) >= 0", appointment.end_time, appointment.start_time]}}


end
