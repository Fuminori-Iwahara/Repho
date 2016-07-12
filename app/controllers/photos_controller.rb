class PhotosController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @photos = Photo.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Photo.create(title: photo_params[:title], image: photo_params[:image], comment: photo_params[:comment], user_id: current_user.id)
  end

  def destroy
    photo = Photo.find(params[:id])
    if photo.user_id ==current_user.id
      photo.destroy
    end
  end

  private
  def photo_params
    params.permit(:title, :image, :comment)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
