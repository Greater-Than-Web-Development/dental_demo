class Appointment < ActiveRecord::Base
  belongs_to :hygienist
  belongs_to :dentist
  belongs_to :chair
  belongs_to :patient
  has_many :bookings
  has_many :time_slots, through: :bookings

      # Database Fields
      # t.date :date
      # t.integer :dentist_id
      # t.integer :time_slot_id
      # t.integer :chair_id
      # t.integer :hygienist_id
      # t.integer :patient_id
      # t.string :type
      # t.boolean :patient_confirmed
      # t.boolean :confirmation_sent

end
