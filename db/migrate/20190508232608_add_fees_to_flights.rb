class AddFeesToFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :fee, :decimal

    remove_column :flights, :duration, :integer
    add_column :flights, :adult_fee, :decimal, precision: 8, scale: 2
    add_column :flights, :child_fee, :decimal, precision: 8, scale: 2
  end
end
