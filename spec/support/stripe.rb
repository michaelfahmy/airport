module Stripe
  module TokenHelpers
    Stripe.api_key = Rails.application.config_for(:stripe)['secret_key']

    def stripe_token
      token = Stripe::Token.create(
        card: {
          number: '4242424242424242',
          exp_month: 5,
          exp_year: 2020,
          cvc: '314',
        },
      )

      token['id']
    end

    def create_charge(reservation)
      ch = StripeApi.create_charge(stripe_token, 200, 'EUR', reservation: 'testing charge')
      create(
        :charge,
        reservation: reservation,
        charge_uid: ch.id,
        amount: ch.amount,
        currency: ch.currency,
        status: ch.status,
        receipt_url: ch.receipt_url,
      )
    end
  end
end

RSpec.configure do |config|
  config.include Stripe::TokenHelpers, type: :controller
end
