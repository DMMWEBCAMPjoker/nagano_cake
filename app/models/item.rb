class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

has_one_attached :image
validates :name, presence: true
validates :description, presence: true
validates :genre_id, presence: true
validates :price, presence: true

def get_item_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_fit: [width, height]).processed
end

def add_tax_price
  (self.price * 1.10).round
end

end
