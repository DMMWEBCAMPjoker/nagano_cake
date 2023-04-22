class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items,dependent: :destroy
  enum payment_method: {credit_card: 1, transfer: 2 }
  enum status: { waiting_payment: 1, payment_confirmation: 2, in_production: 3, preparing_delivery: 4, delivered: 5 }
end
