class Stripe::CreateCharge < ApplicationService
  def initialize(token, reservation)
    @token = token
    @reservation = reservation
  end

  def call
    stripe_charge = create_stripe_charge

    @charge = build_charge(stripe_charge)

    if @charge.save
      Success.new(@charge)
    else
      Error.new(@charge.errors.full_messages)
    end
  rescue Stripe::StripeError => e
    Error.new(e.message)
  end

  private

  def create_stripe_charge
    StripeApi.create_charge(
      @token,
      @reservation.total_fees,
      @reservation.flight.airline.currency,
      reservation: @reservation.id
    )
  end

  def build_charge(stripe_charge)
    @reservation.build_charge(
      charge_uid: stripe_charge.id,
      amount: stripe_charge.amount,
      currency: stripe_charge.currency,
      status: stripe_charge.status,
      receipt_url: stripe_charge.receipt_url,
    )
  end
end
