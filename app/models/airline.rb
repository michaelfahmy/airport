class Airline < ApplicationRecord
  has_many :airplanes, dependent: :destroy

  validates :name, :currency, presence: true
end
