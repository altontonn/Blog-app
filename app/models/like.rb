class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_likes_counter
    post.increment!(:LikesCounter)
  end
end
