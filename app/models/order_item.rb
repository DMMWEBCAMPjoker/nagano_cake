class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: { cannot_start: 1, waiting_production: 2, in_production: 3, completion_production: 4 }

  def subtotal
    item.add_tax_price * quantity.to_i
  end
end
