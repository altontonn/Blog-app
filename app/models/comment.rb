class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_post_comment_counter
    post.increment!(:CommentsCounter)
  end
end
