class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      # t.string :email #included devise migration
      t.string :phone
      t.date :date_of_birth

      t.timestamps
    end
  end
end