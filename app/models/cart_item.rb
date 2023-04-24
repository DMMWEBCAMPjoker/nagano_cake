class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

validates :quantity, presence: true

  def subtotal
    item.add_tax_price * quantity.to_i
  end

end
