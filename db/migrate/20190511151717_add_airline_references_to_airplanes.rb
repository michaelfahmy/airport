class AddAirlineReferencesToAirplanes < ActiveRecord::Migration[5.2]
  def change
    add_reference :airplanes, :airline
  end
end
