class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_associated :order
  validates_associated :product # required
  validates :quantity, presence: true
end
