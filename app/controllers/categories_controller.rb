class CategoriesController < ApplicationController
  def index # renderiza todas as categorias
    @categories = Category.all.order(:title)
    render json: @categories
  end
end
