class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_author_post_counter

  def update_author_post_counter
    user.increment!(:posts_counter)
  end

  private

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
