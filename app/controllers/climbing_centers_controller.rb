class ClimbingCentersController < ApplicationController
  before_action :set_climbing_center
  include RatingsHelper

    def index
      @climbing_centers = ClimbingCenter.all
    end

    def show
      @comments=@climbing_center.comments
      if user_signed_in?
        @rating_by_current_user = Rating.find_by(user_id: current_user.id, climbing_center_id: @climbing_center)
      else
      end

      @ratings = ClimbingCenter.where(id: @climbing_center.id)
      if @ratings.blank?
        @rating_avg = 0
      else
        @rating_avg = @ratings.average(:average_total_rating)

      end

      @city_index = ClimbingCenter.where(city_id: @climbing_center.city_id)

    end

  private

    def set_climbing_center
      @climbing_center = ClimbingCenter.find(params[:id])
    end

end
