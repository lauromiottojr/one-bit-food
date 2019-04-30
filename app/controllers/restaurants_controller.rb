class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show
  def index # lista restaurantes proximos
    @restaurants = Restaurant.near(params[:city] || 'São Paulo') # model.near procura os endereços proximos
    # procura por cidade primeiro, se nao existir, procura por SP
    filter_by_category if params[:category] # filtrar restaurantes por categoria, se o parametro categoria == true
    render json: @restaurants # renderiaza os restaurantes
  end

  def show
    render json: @restaurant, product_categories: true # quando chama o show url fica restaurants/?id
  end

  def search
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id]) # procura o restaurante por id
  end

  def filter_by_category
    @restaurants = @restaurants.select do |r| # selecionar os elementos de tal caracteristica
      r.category.title == params[:category] # no caso, de tal categoria
    end
  end

end
