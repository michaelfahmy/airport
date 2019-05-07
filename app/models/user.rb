class User < ApplicationRecord
  enum role: { manager: 0, consumer: 1 }

  has_many :reservations, dependent: :nullify

  validates :role, presence: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
