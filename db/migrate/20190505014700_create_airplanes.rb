class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :model
      t.integer :business_class_rows
      t.integer :economy_class_rows
      t.integer :seats_per_row

      t.timestamps
    end
  end
end
