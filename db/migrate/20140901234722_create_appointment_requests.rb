class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :appointment_id
      t.string :date
      t.string :type
      t.text :message
      t.time :time
      t.string :time_of_day
      t.boolean :request_read

      t.timestamps
    end
  end
end
