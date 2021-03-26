class CitiesController < ApplicationController
  include CitiesHelper
  include RatingsHelper
  
  before_action :get_order_type, only: :show
  
  def index 
    @cities = City.all
  end 

  def show
    @city = City.find(params[:id])
    filter_climbing_centers
    get_order_price_type_and_price_attribut
  end

  private

  def climbing_center_size(city)

    @climbing_center = CLimbinCenter.where(city_id: city)

  end

end
