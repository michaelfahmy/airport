class Passenger < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  enum passenger_type: { adult: 0, child: 1 }
  enum passenger_class: { economy: 0, business: 1 }

  belongs_to :reservation

  delegate :flight, to: :reservation, allow_nil: true

  validates :first_name, :last_name,
            :passenger_type, :passenger_class, :seat,
            presence: true
  validates_with Passenger::SeatValidator
end
