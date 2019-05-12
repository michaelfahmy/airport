class Charge < ApplicationRecord
  belongs_to :reservation

  validates :charge_uid, :amount, :currency, :status, :receipt_url, presence: true
end
