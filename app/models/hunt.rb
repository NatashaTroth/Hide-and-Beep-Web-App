# frozen_string_literal: true

class Hunt < ApplicationRecord
  has_many :hints, dependent: :destroy
  belongs_to :user
  validates :name, :start_date, :expiry_date, :winning_code, :authentification_key, presence: true
  validates :authentification_key, uniqueness: true
  validates :start_date, :expiry_date, date: true
  validates :name, length: { maximum: 30 }
  validates :winning_code, length: { maximum: 20 }

  # Validate that start_date is not in the past
  validates :start_date,
            date: { after_or_equal_to: proc { Date.today }, message: 'cannot be in the past' },
            on: :create

  # Validate that expiry_date is not before start_date
  validates :expiry_date,
            date: { after_or_equal_to: :start_date, message: 'cannot be before the start date' }


  def create_authentification_key
    # modified from https://stackoverflow.com/a/88341
    auth_key = ""
    loop do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      auth_key = (0...10).map { o[rand(o.length)] }.join
      break unless (Hunt.exists?(authentification_key: auth_key))
    end
    self.authentification_key = auth_key
  end
end
