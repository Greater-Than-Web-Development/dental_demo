class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.integer :office_id
      t.string :room

      t.timestamps
    end
  end
end
