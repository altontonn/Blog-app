class LikesController < ApplicationController
  def create
    @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @likes = Like.new(user_id: @user.id, post_id: params[:post_id])
    if @likes.save
      flash.now[:success] = 'Liked'
      @post.increment(:likes_counter)
      redirect_to user_posts_path(@user, @post)
    else
      flash.now[:error] = 'Error'
    end
  end
end
