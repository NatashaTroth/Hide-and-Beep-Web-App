# frozen_string_literal: true

class AddPositionToHints < ActiveRecord::Migration[5.2]
  def change
    add_column :hints, :position, :integer
  end
end
