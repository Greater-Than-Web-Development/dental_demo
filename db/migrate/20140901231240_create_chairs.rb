class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :room

      t.timestamps
    end
  end
end
