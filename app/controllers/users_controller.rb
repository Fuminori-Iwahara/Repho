class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @photos = current_user.photos.page(params[:page]).per(5).order("created_at DESC")
  end
end
