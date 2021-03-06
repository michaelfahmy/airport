ActiveAdmin.register Airplane do
  includes :airline

  permit_params :model, :business_class_rows, :economy_class_rows, :seats_per_row

  filter :model_contains
  filter :business_class_rows
  filter :economy_class_rows
  filter :seats_per_row

  sidebar 'Flights', only: %i[show edit] do
    ul do
      li link_to 'Flights', admin_flights_path(q: { airplane_id_eq: resource.id })
    end
  end
end
