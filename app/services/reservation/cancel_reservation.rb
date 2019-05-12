class Reservation::CancelReservation
  def self.call(reservation)
    new(reservation).call
  end

  def initialize(reservation)
    @reservation = reservation
  end

  def call
    @refund = Stripe::RefundCharge.call(@reservation)

    if @refund.success?
      if @reservation.destroy
        Success.new(@reservation)
      else
        Error.new(@refund.errors)
      end
    else
      Error.new(@refund.errors)
    end
  end
end
