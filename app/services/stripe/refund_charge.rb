class Stripe::RefundCharge
  def self.call(reservation)
    new(reservation).call
  end

  def initialize(reservation)
    @reservation = reservation
  end

  def call
    @refund = refund_stripe_charge

    Success.new(@refund)
  rescue Stripe::StripeError => e
    Error.new(e.message)
  end

  private

  def refund_stripe_charge
    StripeApi.refund_charge(@reservation.charge.charge_uid, refund_amount.to_i)
  end

  def refund_amount
    d = time_diff
    amount = @reservation.charge.amount

    if d > 1.month.to_i
      amount
    elsif d > 1.week.to_i
      amount * 0.8
    else
      amount * 0.5
    end
  end

  def time_diff
    @reservation.flight.departure_time.in_time_zone(@reservation.user.time_zone) - Time.current
  end
end
