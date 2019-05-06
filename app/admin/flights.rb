ActiveAdmin.register Flight do
  permit_params :number, :departure_airport, :destination_airport, :departure_time, :arrival_time, :duration, :airplane_id
end
