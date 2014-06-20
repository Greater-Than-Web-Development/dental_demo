class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :patient_id
      t.date :date
      t.time :time
      t.boolean :morning, null: false
      t.string :appointment_type
      t.boolean :request_read, null: false, default: false

      t.timestamps
    end
  end
end
