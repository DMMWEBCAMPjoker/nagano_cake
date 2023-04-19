class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

has_one_attached :image
#validates :image, presence: true

# def get_item_image
#   (image.attached?) ? image : 'no_image.jpg'
# end

def add_tax_price
  (self.price * 1.10).round
end

end
