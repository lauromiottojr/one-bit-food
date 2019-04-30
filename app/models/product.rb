class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_products

  validates_associated :product_category
  validates :name, presence: true # required
  validates :price, presence: true

  has_one_attached :image # vai ter um arquivo de imagem
end
