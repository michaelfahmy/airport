class FlightSerializer < ActiveModel::Serializer
  attributes :id,
             :number,
             :departure_airport,
             :destination_airport,
             :adult_fee,
             :child_fee

  attribute :departure_time do
    object.departure_time.in_time_zone(scope[:current_user]&.time_zone)
  end

  attribute :arrival_time do
    object.arrival_time.in_time_zone(scope[:current_user]&.time_zone)
  end

  attribute :duration do
    Time.at(object.arrival_time - object.departure_time).utc.strftime('%khrs %mmin')
  end

  attribute :available_seats do
    object.available_seats
  end

  attribute :airplane do
    {
      model: object.airplane.model,
      seats_cnt: object.airplane.seats.size,
      available_seats_cnt: object.available_seats.size,
    }
  end
end
