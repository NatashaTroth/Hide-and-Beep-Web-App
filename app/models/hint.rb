class Hint < ApplicationRecord
    belongs_to :hunt
    validates :location_name, :longitude, :latitude, :text, :hunt_id, presence: true
    validates :longitude, :latitude, numericality: true 
    validates :text, length: { maximum: 200 }
    validates :location_name, length: { maximum: 15 }
end
