class AddUserToHunts < ActiveRecord::Migration[5.2]
  def change
    add_reference :hunts, :user, foreign_key: true
  end
end
