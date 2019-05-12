class StripeApi
  Stripe.api_key = Rails.application.config_for(:stripe)['secret_key']

  class << self
  end
end
