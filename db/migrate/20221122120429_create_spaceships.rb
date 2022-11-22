class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :type
      t.string :location
      t.integer :price
      t.text :description
      t.boolean :spead_of_light
      t.integer :capacity
      t.string :fuel_drive
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
