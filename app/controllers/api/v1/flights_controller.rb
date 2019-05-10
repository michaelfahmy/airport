class Api::V1::FlightsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!

  def index
    load_flights
    render json: @flights
  end

  private

  def scope
    policy_scope(Flight)
  end

  def load_flights
    @flights = scope.where('departure_time > ?', Time.current)
  end
end
