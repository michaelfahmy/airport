ActiveAdmin.register Reservation do
  actions :all, except: [:new, :create, :edit, :update]
end
