class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 1
    add_index :users, :role
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
