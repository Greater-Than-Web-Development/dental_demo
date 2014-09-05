class CreateHygienists < ActiveRecord::Migration
  def change
    create_table :hygienists do |t|
      t.string :first_name
      t.string :last_name
      t.string :works_on

      t.timestamps
    end
  end
end
