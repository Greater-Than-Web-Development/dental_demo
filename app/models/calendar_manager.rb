class CalendarManager
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :workday, :date

  validates :workday, :date, presence: true
  validates :workday, :date, uniqueness: true

  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=" value)
    end
  end

  def persisted?
    false
  end

  def generate_time_slots!
    # Work day begins at 9am
    hour = 9
    minute = 0
    @time_slots = Array.new

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
      beginning = TimeOfDay.parse(hour) + minute.minutes
      ending = start_time + 15.minutes
      time_slot = TimeSlot.new work_day_id: self.workday.id, start_time: beginning.strftime("%I:%M %p"), end_time: ending.strftime("%I:%M %p")
      @time_slots << time_slot
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