ActiveAdmin.register Airline do
  permit_params :name, :currency

  filter :name_contains
  filter :currency, as: :select, collection: Currencies::CURRENCIES.map { |c| c[:code] }

  form do |f|
    f.inputs do
      f.input :name
      f.input :currency, as: :select, collection: Currencies::CURRENCIES.map { |c| c[:code] }
    end
    f.actions
  end
end
