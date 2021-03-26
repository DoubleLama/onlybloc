class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @climbing_center = ClimbingCenter.find(params[:climbing_center_id])
    check_if_exist
    @rating = Rating.create(ambiance: params[:ambiance],service: params[:service],cleanliness: params[:cleanliness],route: params[:route], user_id: current_user.id, climbing_center_id: @climbing_center.id)
    if @rating.save
      get_average_ambiance
      get_average_service
      get_average_cleanliness
      get_average_route
      @climbing_center.average_ambiance=@average_ambiance
      @climbing_center.average_service=@average_service
      @climbing_center.average_cleanliness=@average_cleanliness
      @climbing_center.average_route=@average_route
      @climbing_center.save
      get_average_total
      @climbing_center.average_total_rating=@total_average
      @climbing_center.save
        redirect_to climbing_center_path(params[:climbing_center_id]), notice: 'Merci, ta note a été enregistrée!'
    else
        redirect_to climbing_center_path(params[:climbing_center_id]), notice: "Il y a un problème, ta note n'a pas été enregistrée"
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end


  private

  def rating_params
    params.require(:rating).permit(:ambiance)
  end

  def check_if_exist
    rate = Rating.find_by(user_id: current_user.id, climbing_center_id: @climbing_center.id)
    if rate != nil
      rate.destroy
    end
  end

  def get_average_ambiance
    sum=0
    i=0
    ratings=Rating.where(climbing_center_id: @climbing_center.id)
    ratings.all.each{ |rating|
      if rating.ambiance != nil
        sum=sum+rating.ambiance
        i=i+1
      end
      }
      if sum != 0
      @average_ambiance=sum/i
      end
  end

  def get_average_cleanliness
    sum=0
    i=0
    ratings=Rating.where(climbing_center_id: @climbing_center.id)
    ratings.all.each{ |rating|
      if rating.cleanliness != nil
        sum=sum+rating.cleanliness
        i=i+1
      end
    }
    if sum != 0
      @average_cleanliness=sum/i
    end
  end

  def get_average_service
    sum=0
    i=0
    ratings=Rating.where(climbing_center_id: @climbing_center.id)
    ratings.all.each{ |rating|
      if rating.service != nil
        sum=sum+rating.service
        i=i+1
      end
    }
    if sum != 0
      @average_service=sum/i
    end
  end

  def get_average_route
    sum=0
    i=0
    ratings=Rating.where(climbing_center_id: @climbing_center.id)
    ratings.all.each{ |rating|
      if rating.route != nil
        sum=sum+rating.route
        i=i+1
      end
    }
    if sum != 0
      @average_route=sum/i
    end
  end

  def get_average_total
    i=0
    total = 0
    if @climbing_center.average_ambiance != nil
      i=i+1
      total = total + @climbing_center.average_ambiance
    end
    if @climbing_center.average_route != nil
      i=i+1
      total = total + @climbing_center.average_route
    end
    if @climbing_center.average_service != nil
      i=i+1
      total = total + @climbing_center.average_service
    end
    if @climbing_center.average_cleanliness != nil
      i=i+1
      total = total + @climbing_center.average_cleanliness
    end
    if i != 0 && i != nil
      @total_average = (total/i)
    end
  end
end
