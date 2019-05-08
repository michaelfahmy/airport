ActiveAdmin.register Reservation do
  actions :all, except: %i[new create edit update]

  filter :flight, as: :select, collection: Flight.all.map { |f| [f.number, f.id] }
  filter :confirmation_number_contains
end
