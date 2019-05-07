ActiveAdmin.register Flight do
  includes :airplane

  permit_params :number, :departure_airport, :destination_airport, :departure_time, :arrival_time, :duration, :airplane_id

  filter :airplane, as: :select, collection: Airplane.pluck(:model, :id)
  filter :number_equals
  filter :departure_airport, as: :select, collection: Airports.all.map { |a| ["#{a.name} (#{a.iata})", a.iata] }
  filter :destination_airport, as: :select, collection: Airports.all.map { |a| ["#{a.name} (#{a.iata})", a.iata] }
  filter :departure_time
  filter :arrival_time

  form do |f|
    f.inputs do
      f.input :airplane, as: :select, collection: Airplane.pluck(:model, :id)
      f.input :number
      f.input :departure_airport, as: :datalist, collection: Airports.all.map { |a| ["#{a.name} (#{a.iata})", a.iata] }
      f.input :destination_airport, as: :datalist, collection: Airports.all.map { |a| ["#{a.name} (#{a.iata})", a.iata] }
      f.input :departure_time, as: :datetime_picker
      f.input :arrival_time, as: :datetime_picker
    end
    f.actions
  end
end
