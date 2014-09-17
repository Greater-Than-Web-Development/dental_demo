module AppointmentTools

  def time_slot_format(time)
    time = time.to_s
    TimeOfDay.parse(time).strftime('%I:%M %p')
  end

  def range(start_range=start_time, end_range=end_time)
    @range ||= Shift.new(TimeOfDay.parse(self.try(start_range)), TimeOfDay.parse(self.try(end_range)))
  end

end