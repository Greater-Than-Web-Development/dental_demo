class Appointment < ActiveRecord::Base

  belongs_to :hygienist
  belongs_to :dentist
  belongs_to :patient
  has_many :bookings
  has_many :time_slots, through: :bookings

  validates :of_type, inclusion: { in: %w(major minor),
    message: "%{value} is not a valid appointment type, please choose either 'major' or 'minor' " }

  # Scope

  def self.major
    where(of_type: major)
  end

  def major?
    if !self.of_type.nil?
      self.of_type == "major".downcase
    else
      false
    end
  end

  # validates_uniqueness_of :chair_id, scope: :time_slot_id

end
