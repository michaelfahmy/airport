class CreateAirlines < ActiveRecord::Migration[5.2]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :currency, default: 'EUR'

      t.timestamps
    end
  end
end
