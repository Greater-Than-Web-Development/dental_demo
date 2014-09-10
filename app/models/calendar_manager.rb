class CalendarManager

  def initialize(workday,date=Date.today)
    if workday.class == WorkDay
      @workday = workday
    end
    @date = date
  end

  def generate_time_slots!
    # Work day begins at 9am
    hour = 9
    minute = 0
    @time_slots = Array.new

    #generate morning slots
    33.times do
      time = TimeOfDay.parse(hour) + minute.minutes
      @time_slots << time.strftime("%I:%M %p")
      minute += 15
    end
  end

  def generate_time_slots!
    # Work day begins at 9am
    hour = 9
    minute = 0
    @time_slots = Array.new

    #generate morning slots
    33.times do
      time = TimeOfDay.parse(hour) + minute.minutes
      @time_slots << time.strftime("%I:%M %p")
      minute += 15
    end
  end

  array1.zip(array2).each do |array1_var, array2_var|



    slots.each { |key, value| original[key] = value.to_i }

    ["room one", "room two"].each do |start_time|
      Chair.find_or_create_by(room: room) do |chair|
        chair.booked = [true,false][rand(2)]
      end
    end


end