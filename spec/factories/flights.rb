FactoryBot.define do
  factory :flight do
    airplane
    number { 127 }
    departure_airport { 'CAI' }
    destination_airport { 'DXB' }
    departure_time { Time.current.tomorrow }
    arrival_time { Time.current.tomorrow + 4.hours }
    adult_fee { 4599 }
    child_fee { 2499 }
  end
end
