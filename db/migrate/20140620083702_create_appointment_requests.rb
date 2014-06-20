class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :patient_id
      t.date :date
      t.time :time
      t.boolean :morning?
      t.string :appointment_type
      t.boolean :request_read?

      t.timestamps
    end
  end
end
