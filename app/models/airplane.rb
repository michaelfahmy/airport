class Airplane < ApplicationRecord
  belongs_to :airline
  has_many :flights, dependent: :destroy

  validates :model, :business_class_rows, :economy_class_rows, :seats_per_row, presence: true

  def seats
    seats = []
    (business_class_rows + economy_class_rows).times do |r|
      c = '@'
      seats_per_row.times { seats << "#{r + 1}#{c.next!}" }
    end
    seats
  end
end
