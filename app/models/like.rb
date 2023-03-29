class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_likes_counter
    post.increment!(:LikesCounter)
  end
end
