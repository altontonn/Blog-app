class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id).find_by(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
