class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post Added Successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post could not be added'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @posts = @user.posts.find(params[:id])
    @posts.destroy
    redirect_to user_path(params[:user_id]), notice: 'post deleted successfully';
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @posts = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
