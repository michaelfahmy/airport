class PassengerSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :gender,
             :passenger_type,
             :passenger_class,
             :seat
end
