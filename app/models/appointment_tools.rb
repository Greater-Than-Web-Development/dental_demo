module AppointmentTools

  def time_slot_format(time)
    time = time.to_s
    TimeOfDay.parse(time).strftime('%I:%M %p')
  end

end