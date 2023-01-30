class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def show_post
    @posts = Post.find(params[:id])
  end

  def post
    @posts = Post.all
  end
end
