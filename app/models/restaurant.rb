class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :product_categories
  has_many :orders
  has_many :reviews

  validates_associated :category
  validates :name, presence: true
  validates :status, presence: true
  validates :delivery_tax, presence: true # campos obrigatórios
  validates :city, presence: true
  validates :street, presence: true

  enum status: { closed: 0, open: 1 }

  has_one_attached :image # vai ter um arquivo de imagem

  geocoded_by :address # usar metodo addres
 
  after_validation :geocode
  
  def address
    [street, number, city, state].compact.join(', ') # retorna mais ou menos: 'av .., numero 10, sao paulo, sp'
end
end
