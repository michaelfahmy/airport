FactoryBot.define do
  factory :passenger do
    reservation
    first_name { 'John' }
    last_name { 'Doe' }
    gender { 'male' }
    passenger_type { 'adult' }
    passenger_class { 'economy' }
    seat { '3B' }
  end
end
