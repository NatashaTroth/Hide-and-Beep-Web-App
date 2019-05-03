# frozen_string_literal: true

class CreateHunts < ActiveRecord::Migration[5.2]
  def change
    create_table :hunts do |t|
      t.string :name
      t.date :start_date
      t.date :expiry_date
      t.time :set_time_limit, default: '0'
      t.boolean :no_time_limit, default: false
      t.string :winning_code
      t.string :authentification_key

      t.timestamps
    end
  end
end
