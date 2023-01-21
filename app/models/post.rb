class Post < ApplicationRecord
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  belongs_to :author, class_name: 'User'

  validates :Title, presence: true

  def update_author_post_counter
    author.increment!(:PostsCounter)
  end

  def recent_comment
    comment.order(created_at: :desc).limit(5)
  end
end
