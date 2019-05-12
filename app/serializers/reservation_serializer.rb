class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :confirmation_number

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
    Money.new(object.total_fees * 100, object.flight.airline.currency).format
  end
end
