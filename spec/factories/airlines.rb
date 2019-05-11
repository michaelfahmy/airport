FactoryBot.define do
  factory :airline do
    name { Faker::Company.name }
    currency { Faker::Currency.code }
  end
end
