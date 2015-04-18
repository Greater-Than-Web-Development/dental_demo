class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.date :date
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
