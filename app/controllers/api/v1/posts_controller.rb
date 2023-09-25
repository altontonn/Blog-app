class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
    user_id = params[:user_id]
    @post.user_id = user_id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      render json: @post
    else
      render json: { error: 'unable to create post' }, status: 400
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @posts = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    render json: @comments
  end

  def destroy
    @user = User.find(params[:id])
    @posts = @user.posts.find(params[:id])
    if @posts.destroy
      render json: { message: 'Post successfully deleted' }, status: 200
    else
      render json: { error: 'unable to delete post' }, status: 400
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
