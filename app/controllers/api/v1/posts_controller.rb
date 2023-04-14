class Api::V1::PostsController < ApplicationController
  @user = User.includes(posts: [:comments]).find(params[:user_id])
  @posts = Post.where(user_id: @user.id)
  render json: @posts
end
