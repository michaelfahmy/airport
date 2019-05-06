class Airplane < ApplicationRecord
  has_many :flights, dependent: :destroy
end
