class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.integer :dentist_id
      t.integer :time_slot_id
      t.integer :chair_id
      t.integer :hygienist_id
      t.integer :patient_id
      t.string :type
      t.boolean :patient_confirmed
      t.boolean :confirmation_sent

      t.timestamps
    end
  end
end
