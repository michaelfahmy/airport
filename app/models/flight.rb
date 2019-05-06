class Flight < ApplicationRecord
  belongs_to :airplane

  validates :number, :departure_time, :arrival_time, presence: true

  validates :departure_airport,
            :destination_airport,
            inclusion: { in: Airports.iata_codes, message: 'is not a valid airport' }

  validates_with Flight::DepartureTimeValidator
  validates_with Flight::ArrivalTimeValidator
end
