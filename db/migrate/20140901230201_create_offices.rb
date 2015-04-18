class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.text :address
      t.string :zip
      t.string :city
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
