class Chair < ActiveRecord::Base
  has_many :appointments
  has_many :time_slots, through: :appointments
  belongs_to :office
end
