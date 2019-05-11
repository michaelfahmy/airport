class ReservationSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id

  attribute :user
  attribute :flight
  attribute :passengers
  attribute :total_fees

  def user
    user = object.user
    {
      id: user.id,
      name: "#{user.first_name} #{user.last_name}",
      email: user.email,
      time_zone: user.time_zone,
    }
  end

  def flight
    FlightSerializer.new(object.flight, scope: scope).serializable_hash
  end

  def passengers
    object.passengers.map do |passenger|
      PassengerSerializer.new(passenger).serializable_hash
    end
  end

  def total_fees
    fees = 0.0
    object.passengers.each do |passenger|
      fees += object.flight["#{passenger.passenger_type}_fee"]
    end
    number_to_currency(fees)
  end
end
