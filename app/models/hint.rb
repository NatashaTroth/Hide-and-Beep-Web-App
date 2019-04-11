class Hint < ApplicationRecord
    belongs_to :hunt
    validates :longitude, :latitude, :text, :hunt_id, :location_name, :order, presence: true
end
