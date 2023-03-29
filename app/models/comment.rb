class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_post_comments_counter

  private
  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
