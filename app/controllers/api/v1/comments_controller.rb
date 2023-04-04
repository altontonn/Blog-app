class Api::V1::CommentsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.where(post_id: @posts)
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: 'Success'
    else
      render json: 'Error', error: @comment.errors
    end
  end

  def comment_params
    params.require(:my_comment).permit(:Text)
  end
end
