FactoryBot.define do
  factory :airline do
    name { Faker::Company.name }
    currency { Currencies::CURRENCIES.sample[:code] }
  end
end
