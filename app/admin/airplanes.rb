ActiveAdmin.register Airplane do
  permit_params :model, :business_class_rows, :economy_class_rows, :seats_per_row
end
