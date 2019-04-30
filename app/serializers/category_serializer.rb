class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :image_url # atributos que eu preciso para renderizar
   
  def image_url # criando um metodo para o image_url
    rails_blob_url(object.image) # pegar a imagem da categoria e converte para a url
  end
end