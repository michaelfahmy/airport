ActiveAdmin.register Airline do
  permit_params :name, :currency

  form do |f|
    f.inputs do
      f.input :name
      f.input :currency, as: :select, collection: Money::Currency.table.keys.map(&:upcase)
    end
    f.actions
  end
end
