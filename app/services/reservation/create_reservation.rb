class Reservation::CreateReservation
  def self.call(user, reservation_params, stripe_token)
    new(user, reservation_params, stripe_token).call
  end

  def initialize(user, reservation_params, stripe_token)
    @user = user
    @reservation_params = reservation_params
    @stripe_token = stripe_token
  end

  def call
    @reservation = @user.reservations.new(@reservation_params)

    if @reservation.valid?
      create_charge
      if @charge.success?
        confirm_reservation
        Success.new(@reservation)
      else
        Error.new(@charge.errors)
      end
    else
      Error.new(@reservation.errors)
    end
  end

  private

  def create_charge
    @charge = Stripe::CreateCharge.call(@stripe_token, @reservation)
  end

  def confirm_reservation
    @reservation.confirmation_number = confirmation_number
    @reservation.save
  end

  def confirmation_number
    str = ''
    loop do
      str = SecureRandom.uuid[0..6].upcase
      break unless Reservation.find_by(confirmation_number: str)
    end
    str
  end
end
