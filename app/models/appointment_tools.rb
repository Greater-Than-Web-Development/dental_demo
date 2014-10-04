module AppointmentTools

  def time_slot_format(time)
    time = time.to_s
    TimeOfDay.parse(time).strftime('%I:%M %p')
  end

  def tod_format(time)
    if TimeOfDay.parsable?(time)
      return TimeOfDay.parse(time)
    else
      return puts "Error: This is not a parsable time format."
    end
  end

  def range(start_range, end_range)
    Shift.new(TimeOfDay.parse(start_range), TimeOfDay.parse(end_range))
  end

  def adjacent?(time_object1, time_object2, increment=0)

    if time_object1.nil? or time_object2.nil?
      false
    else
      tod_format(time_object1.end_time) + increment.minutes == tod_format(time_object2.start_time)
    end
  end

end