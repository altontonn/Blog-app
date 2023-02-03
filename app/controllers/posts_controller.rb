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
  end

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
