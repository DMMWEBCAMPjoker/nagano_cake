class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_item,dependent: :destroy

  enum payment_method: {credit_card: 1, transfer: 2 }

end
