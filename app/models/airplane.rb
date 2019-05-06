class Airplane < ApplicationRecord
  has_many :flights, dependent: :destroy

  validates :model, :business_class_rows, :economy_class_rows, :seats_per_row, presence: true
end
