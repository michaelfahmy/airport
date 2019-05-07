FactoryBot.define do
  factory :flight do
    airplane
    number { 127 }
    departure_airport { 'CAI' }
    destination_airport { 'DXB' }
    departure_time { Time.current.tomorrow }
    arrival_time { Time.current.tomorrow + 4.hours }
  end
end
