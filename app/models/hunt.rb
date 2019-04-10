class Hunt < ApplicationRecord
    has_many :hints, dependent: :destroy
    validates :name, :start_date, :expiry_date, :winning_code, presence: true
    validates :name, uniqueness: true 
end
