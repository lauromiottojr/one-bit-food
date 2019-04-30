class Category < ApplicationRecord
    has_many :restaurants

    validates :title, presence: true # required

    has_one_attached :image # vai ter um arquivo de imagem
end
