class Api::V1::ReservationsController < Api::V1::ApplicationController
  def index
    load_reservations
    render_reservations
  end

  def show
    load_reservation
    render_reservation
  end

  def create
    @reservation = Reservation::CreateReservation.call(current_user, reservation_params, params[:token])

    if @reservation.success?
      ReservationMailer.reservation_confirmed(@reservation.data).deliver_later
      render_reservation @reservation.data, :created
    else
      render_reservation_errors @reservation.errors
    end
  end

  def destroy
    load_reservation
    res = Reservation::CancelReservation.call(@reservation)

    if res.success?
      render_reservation res.data
    else
      render_reservation_errors res.errors
    end
  end

  private

  def scope
    policy_scope(current_user.reservations)
  end

  def load_reservations
    @reservations = scope.includes(:flight, :passengers)
  end

  def load_reservation
    @reservation = authorize scope.find(params[:id])
  end

  def render_reservations
    render_json @reservations, scope: { current_user: current_user }
  end

  def render_reservation(reservation = @reservation, status = :ok)
    render_json reservation, scope: { current_user: current_user }, status: status
  end

  def render_reservation_errors(errors = @reservation.errors.full_messages)
    render_errors errors
  end

  def reservation_params
    params.require(:reservation).permit(
      :flight_id,
      passengers_attributes: %i[first_name last_name gender passenger_type passenger_class seat]
    )
  end
end
