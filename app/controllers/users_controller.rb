class UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
end
