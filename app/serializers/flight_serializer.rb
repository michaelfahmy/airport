class FlightSerializer < ActiveModel::Serializer
  attributes :id,
             :number,
             :departure_airport,
             :destination_airport,
             :departure_time,
             :arrival_time,
             :adult_fee,
             :child_fee

  attribute :duration do
    Time.at(object.arrival_time - object.departure_time).utc.strftime('%khrs %mmin')
  end

  attribute :airplane do
    {
      model: object.airplane.model,
      seats_cnt: object.airplane.seats.size,
      available_seats_cnt: object.available_seats.size,
    }
  end
end
