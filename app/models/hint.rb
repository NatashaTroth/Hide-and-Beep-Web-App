class Hint < ApplicationRecord
    belongs_to :hunt
    validates :longitude, :latitude, :text, :hunt_id, presence: true
end
