class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.references :reservation
      t.string :charge_uid
      t.decimal :amount, precision: 8, scale: 2
      t.string :currency
      t.string :status
      t.string :receipt_url

      t.timestamps
    end
  end
end
