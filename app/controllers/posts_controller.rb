class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    # render json: @posts
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    if @post.save
      flash[:success] = 'Post Added Successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Post could not be added'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @posts = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @post }
      format.json { render json: @post }
      format.json { render json: @comments }
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:id])
    @posts.destroy
    redirect_to user_path(params[:user_id]), notice: 'Post deleted Successfully'
  end

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
