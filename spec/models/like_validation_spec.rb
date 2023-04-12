require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(
    name: 'Tom',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Mexico.',
    posts_counter: 0
  )

  post = Post.create(
    title: 'my title',
    text: 'Hello World!',
    comments_counter: 0,
    likes_counter: 1,
    user_id: user.id
  )

  Like.create(user_id: user.id, post_id: post.id)

  context '#increment_post_likes_counter' do
    it 'increments post likes counter by 1' do
      expect(post.likes_counter).to eq(1)
    end
  end
end