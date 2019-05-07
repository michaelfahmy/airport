FactoryBot.define do
  factory :passenger do
    reservation
    first_name { 'John' }
    last_name { 'Doe' }
    gender { 0 }
    passenger_type { 0 }
    passenger_class { 1 }
    seat { '3B' }
    fee { '200.99' }
  end
end
