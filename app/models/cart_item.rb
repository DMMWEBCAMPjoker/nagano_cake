class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  
  def subtotal
<<<<<<< HEAD
    item.add_tax_price * quantity.to_i
=======
    item.add_tax_price * quantity
>>>>>>> origin/develop
  end
  
end
