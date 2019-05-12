class StripeApi
  Stripe.api_key = Rails.application.config_for(:stripe)['secret_key']

  class << self
    def create_charge(token, amount, currency, metadata)
      Stripe::Charge.create(
        source: token,
        amount: Money.from_amount(amount, currency).cents,
        currency: currency.downcase,
        metadata: metadata,
      )
    end

    def refund_charge(charge_id, amount)
      Stripe::Refund.create(
        charge: charge_id,
        amount: amount,
      )
    end
  end
end
