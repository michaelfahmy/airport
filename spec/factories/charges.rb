FactoryBot.define do
  factory :charge do
    reservation
    charge_uid { 'ch_some_uid' }
    amount { 9.99 }
    currency { 'EUR' }
    status { 'succeeded' }
    receipt_url { 'https://example.com' }
  end
end
