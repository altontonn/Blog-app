require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(
    Name: 'Tom',
    Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    Bio: 'Teacher from Mexico.',
    PostsCounter: 0
  )

  post = Post.create(
    Title: 'my title',
    Text: 'Hello World!',
    CommentsCounter: 0,
    LikesCounter: 1,
    user_id: user.id
  )

  Like.create(user_id: user.id, post_id: post.id)

  context '#increment_post_likes_counter' do
    it 'increments post likes counter by 1' do
      expect(Post.find(post.id).LikesCounter).to eq(1)
    end
  end
end
