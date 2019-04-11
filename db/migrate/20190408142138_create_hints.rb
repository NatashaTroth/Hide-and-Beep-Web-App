class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.integer :order
      t.string :location_name
      t.decimal :latitude
      t.decimal :longitude
      t.text :text
      t.integer :hunt_id, foreign_key: true

      t.timestamps
    end

    add_foreign_key :hints, 
                    :hunts, 
                    column: :hunt_id
    add_index :hints, :hunt_id
  end
end
