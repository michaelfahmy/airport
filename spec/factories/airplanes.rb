FactoryBot.define do
  factory :airplane do
    airline
    model { 'Airbus A350-900' }
    business_class_rows { 5 }
    economy_class_rows { 55 }
    seats_per_row { 8 }
  end
end
