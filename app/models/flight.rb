class Flight < ApplicationRecord
  belongs_to :airplane

  has_many :reservations, dependent: :nullify

  validates :number, :departure_time, :arrival_time, presence: true
  validates :departure_airport,
            :destination_airport,
            inclusion: { in: Airports.iata_codes, message: 'is not a valid airport' }
  validates_with Flight::DepartureTimeValidator
  validates_with Flight::ArrivalTimeValidator
  validates_with Flight::AirplaneValidator

  def available_seats
    airplane.seats - passengers.pluck(:seat)
  end
end
