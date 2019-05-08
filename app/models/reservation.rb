class Reservation < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  has_many :passengers, dependent: :destroy
end
