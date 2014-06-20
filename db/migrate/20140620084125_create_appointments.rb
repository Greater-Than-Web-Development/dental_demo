class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :chair_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :appointment_type
      t.boolean :confirmation_sent, null: false, default: false
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end
  end
end