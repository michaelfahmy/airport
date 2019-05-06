ActiveAdmin.register Airplane do
  permit_params :model, :business_class_rows, :economy_class_rows, :seats_per_row

  sidebar 'Flights', only: [:show, :edit] do
    ul do
      li link_to 'Flights', admin_flights_path(q: { airplane_id_eq: resource.id })
    end
  end
end
