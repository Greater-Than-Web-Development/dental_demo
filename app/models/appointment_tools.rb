module AppointmentTools

  def time_slot_format(time)
    time = time.to_s
    TimeOfDay.parse(time).strftime('%I:%M %p')
  end

  def range(start_range, end_range)
    Shift.new(TimeOfDay.parse(start_range), TimeOfDay.parse(end_range))
  end

  def self.adjacent?(object1, object2, increment=0)
    object1.start_time + increment.minutes == object2.start_time
  end

end