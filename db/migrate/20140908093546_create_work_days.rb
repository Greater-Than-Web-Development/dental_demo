class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.date :date
      t.beginning :string
      t.ending :string
      t.timestamps
    end
  end
end
