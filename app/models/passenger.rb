class Passenger < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  enum passenger_type: { adult: 0, child: 1 }
  enum passenger_class: { economy: 0, business: 1 }

  belongs_to :reservation
end
