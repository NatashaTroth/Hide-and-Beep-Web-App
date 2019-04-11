class Hint < ApplicationRecord
    belongs_to :hunt
    validates :order, :longitude, :latitude, :text, :hunt_id, presence: true
    validates :order, :numericality => { :greater_than_or_equal_to => 0 }
    validates :longitude, :latitude, numericality: true 
    validates :text, length: { maximum: 200 }
end
