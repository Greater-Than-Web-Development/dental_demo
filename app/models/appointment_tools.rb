module AppointmentTools

  def time_slot_format(time)
    time = time.to_s
    TimeOfDay.parse(time).strftime('%I:%M %p')
  end

  def tod_format(time)
    TimeOfDay.parse(time)
  end

  def range(start_range, end_range)
    Shift.new(TimeOfDay.parse(start_range), TimeOfDay.parse(end_range))
  end

  def self.adjacent?(object1, object2, increment=0)
    tod_format(object1.end_time) + increment.minutes == tod_format(object2.start_time)
  end

end