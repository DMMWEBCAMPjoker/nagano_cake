class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  #デリバリーアソシエーション
  has_many :deliveries, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
