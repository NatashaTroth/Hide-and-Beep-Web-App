class Hunt < ApplicationRecord
    has_many :hints, dependent: :destroy
    validates :name, :start_date, :expiry_date, :winning_code, :authentification_key, presence: true
    validates :name, uniqueness: true 
    validates :start_date, :expiry_date, date: true 
    
    #Validate that start_date is not in the past
    validates :start_date,
    date: { after_or_equal_to: Proc.new { Date.today }, message: 'cannot be in the past' },
    on: :create

    #Validate that expiry_date is not before start_date
    validates :expiry_date,
          date: { after_or_equal_to: :start_date, message: 'cannot be before the start date'  }

end
