FactoryBot.define do
  factory :reservation do
    flight
    user
    confirmation_number { Faker::Alphanumeric.alphanumeric(6).upcase }
  end
end
