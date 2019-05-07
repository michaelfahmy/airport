class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :flight
      t.references :user
      t.string :confirmation_number

      t.timestamps
    end
  end
end
