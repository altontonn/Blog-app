class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  private

  def update_post_comment_counter
    post.increment!(:CommentsCounter)
  end
end
