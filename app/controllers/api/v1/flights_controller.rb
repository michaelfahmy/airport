class Api::V1::FlightsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!

  def index
    load_flights
    render json: @flights, scope: { current_user: current_user }
  end

  private

  def scope
    policy_scope(Flight)
  end

  def load_flights
    @flights = scope.includes(:airplane, :passengers).where('departure_time > ?', Time.current).order(:departure_time)
  end
end
