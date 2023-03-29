require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(
    Name: 'Tom',
    Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    Bio: 'Teacher from Mexico.',
    PostsCounter: 0
  )

  post = Post.create(
    Title: 'my title',
    Text: 'Hello World!',
    CommentsCounter: 1,
    LikesCounter: 0,
    user_id: user.id
  )

  Comment.create(
    user_id: user.id,
    post_id: post.id,
    Text: 'A nice post'
  )

  context '#increment_post_comments_counter' do
    it 'increments post comments counter by 1' do
      expect(Post.find(post.id).CommentsCounter).to eq(1)
    end
  end
end
