class CreateDentists < ActiveRecord::Migration
  def change
    create_table :dentists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :office_id

      t.timestamps
    end
  end
end
