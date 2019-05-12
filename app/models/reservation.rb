class Reservation < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  has_one :charge, dependent: :destroy
  has_many :passengers, dependent: :destroy

  validates :confirmation_number, uniqueness: true, allow_nil: true

  accepts_nested_attributes_for :passengers

  def total_fees
    passengers.inject(0) { |fees, passenger| fees + flight["#{passenger.passenger_type}_fee"] }
  end
end
