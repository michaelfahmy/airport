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
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render_reservation :created
    else
      render_reservation_errors
    end
  end

  def destroy
    load_reservation

    if @reservation.destroy
      render_reservation
    else
      render_reservation_errors
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

  def render_reservation(status = :ok)
    render_json @reservation, scope: { current_user: current_user }, status: status
  end

  def render_reservation_errors
    render_errors @reservation.errors.full_messages.to_sentence
  end

  def reservation_params
    params.require(:reservation).permit(
      :flight_id,
      passengers_attributes: %i[first_name last_name gender passenger_type passenger_class seat]
    )
  end
end
