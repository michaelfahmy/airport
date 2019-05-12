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
  end
end

RSpec.configure do |config|
  config.include Stripe::TokenHelpers, type: :controller
end
