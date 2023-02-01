class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: @user.id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
