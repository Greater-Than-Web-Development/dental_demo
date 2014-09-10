class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.integer :work_day_id
      t.string :start_time
      t.string :end_time
      t.date :date
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
