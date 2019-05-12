class Reservation < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  has_many :passengers, dependent: :destroy

  validates :confirmation_number, uniqueness: true, allow_nil: true

  accepts_nested_attributes_for :passengers
end
