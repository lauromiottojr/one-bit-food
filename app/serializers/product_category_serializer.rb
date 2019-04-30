class ProductCategorySerializer < ActiveModel::Serializer
  attributes :id, :title # atributo pai
 
  has_many :products # devolve os produtos da categoria
end
