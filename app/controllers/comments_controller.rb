class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @climbing_center = ClimbingCenter.find(params[:climbing_center_id])
    @comment = Comment.create(body: params[:body], user_id: current_user.id, climbing_center_id: @climbing_center.id)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to climbing_center_path(params[:climbing_center_id]) }
        format.js { }
      end 
    else
        redirect_to climbing_center_path(params[:climbing_center_id]), notice: "Votre commentaire n'a pas pu être posté!"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @climbing_center = ClimbingCenter.find(params[:climbing_center_id])
    @comment = Comment.find(params[:id])
    if @comment.update(body: params[:body])
      @comment = Comment.new
      @comments = @climbing_center.comments
      redirect_to climbing_center_path(@climbing_center.id)
    end
  end

  def destroy
   @climbing_center = ClimbingCenter.find(params[:climbing_center_id])
   @comment = Comment.find(params[:id])
   if @comment.destroy
     respond_to do |format|
       format.html { }
       format.js { }
     end
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
