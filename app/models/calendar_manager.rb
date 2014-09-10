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

  #ToDo make method more flexible
  def generate_time_slots!
    # Work day begins at 9am
    day = self.workday.date
    hour = 9
    minute = 0
    @time_slots = Array.new

    33.times do
      beginning = TimeOfDay.parse(hour) + minute.minutes
      ending = beginning + 15.minutes
      time_slot = TimeSlot.create work_day_id: self.workday.id, start_time: beginning.strftime("%I:%M %p"), end_time: ending.strftime("%I:%M %p"), date: day
      @time_slots << time_slot
      minute += 15
    end
  end

  def add_new_slot(num_minutes= 60)
    if @time_slots.empty?
      last_slot = "09:00 AM"
    else
      last_slot = Time.parse(@time_slots.last)
      new_slot = last_slot + num_minutes.minutes

      @time_slots << new_slot.strftime("%I:%M %p")
    end
  end

  def remove_slot(index=-1)
    slot = @time_slots.slice!(index)
    puts "Removed #{slot} from #{self.workday.date}"
  end

  def booked_times_for(workday)

    #return all appointments

  end

#   does = is = { true => 'Yes', false => 'No' }
# does[10 == 50]                       # => "No"
# is[10 > 5]                           # => "Yes"

end