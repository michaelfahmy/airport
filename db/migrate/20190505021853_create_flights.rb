class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :departure_airport
      t.string :destination_airport
      t.datetime :departure_time
      t.datetime :arrival_time
      t.integer :duration
      t.references :airplane

      t.timestamps
    end
  end
end
