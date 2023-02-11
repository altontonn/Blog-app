class CommentsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.where(post_id: @posts)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @comments }
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(params[:post_id]), notice: 'Comment deleted Successfully'
  end

  def comment_params
    params.require(:my_comment).permit(:Text)
  end
end
