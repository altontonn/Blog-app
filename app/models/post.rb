class Post < ApplicationRecord
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  belongs_to :author, class_name: 'User'

  after_save :update_author_post_counter

  def update_author_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comment
    comment.order(created_at: :desc).limit(5)
  end
end
