class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.references :reservation
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.integer :passenger_type
      t.integer :passenger_class
      t.string :seat
      t.decimal :fee

      t.timestamps
    end
  end
end
