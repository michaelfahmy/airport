User.create!(
  first_name: 'John',
  last_name: 'Doe',
  role: 'manager',
  email: 'admin@example.com',
  password: 'admin@example.com',
  password_confirmation: 'admin@example.com'
)

AIRPLANES = ['Airbus A321ceo', 'Boeing 787-8', 'Boeing 777-200ER', 'Russian A-50', 'Airbus A320neo', 'Airbus A350-900', 'B747-400', 'DC-9-10', 'DC-9-50'].freeze

3.times do |idx|
  airline = Airline.create!(
    name: "#{Faker::Company.unique.name} Airline",
    currency: %w[USD EUR GBP][idx % 3]
  )

  4.times do
    airline.airplanes.create!(
      model: AIRPLANES.sample,
      business_class_rows: rand(2..6),
      economy_class_rows: rand(20..50),
      seats_per_row: rand(4..9)
    )
  end
end

Airplane.find_each do |airplane|
  departure_time1 = Faker::Time.forward(10)
  arrival_time1 = departure_time1 + rand(2..19).hours
  departure_time2 = Faker::Time.between(11.days.from_now, 20.days.from_now)
  arrival_time2 = departure_time2 + rand(2..19).hours

  airplane.flights.create!([{
    number: rand(100..999),
    departure_airport: Airports.iata_codes[rand(0...Airports.iata_codes.length)],
    destination_airport: Airports.iata_codes[rand(0...Airports.iata_codes.length)],
    departure_time: departure_time1,
    arrival_time: arrival_time1,
    adult_fee: Faker::Number.decimal(4, 2),
    child_fee: Faker::Number.decimal(4, 2),
  }, {
    number: rand(100..999),
    departure_airport: Airports.iata_codes[rand(0...Airports.iata_codes.length)],
    destination_airport: Airports.iata_codes[rand(0...Airports.iata_codes.length)],
    departure_time: departure_time2,
    arrival_time: arrival_time2,
    adult_fee: Faker::Number.decimal(4, 2),
    child_fee: Faker::Number.decimal(4, 2),
  }])
end
