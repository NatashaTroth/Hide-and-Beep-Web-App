class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.text :text
      t.integer :hunt_id

      t.timestamps
    end
  end
end
