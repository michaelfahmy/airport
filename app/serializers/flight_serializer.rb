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
end
