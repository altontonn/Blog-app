require 'rails_helper'

RSpec.describe 'Posts show Page', type: :system do
  describe 'post page' do
    before(:each) do
      @user = User.create(Name: 'Newton', Photo: 'https://i.imgur.com/9yG7zZT.jpg', Bio: 'Am a ruby developer',
                          PostsCounter: 0)
      @post = Post.create(Title: 'Post 1', Text: 'This is post 1', CommentsCounter: 0, LikesCounter: 0,
                          user_id: @user.id)
      @comment = Comment.create(Text: 'This is the first comment', user_id: @user.id, post_id: @post.id)
      @comment2 = Comment.create(Text: 'This is a comment', user_id: @user.id, post_id: @post.id)
      @like = Like.create(user_id: @user.id, post_id: @post.id)
      @like2 = Like.create(user_id: @user.id, post_id: @post.id)
      visit user_post_path(@user.id, @post.id)
    end

    it 'I can see the post\'s title.' do
      expect(page).to have_content(@post.Text)
    end

    it 'I can see the post\'s author.' do
      expect(page).to have_content('Newton')
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content(@post.CommentsCounter)
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content(@post.LikesCounter)
    end

    it 'I can see the post\'s body.' do
      expect(page).to have_content('This is post 1')
    end

    it 'I can the username of each commentor.' do
      expect(page).to have_content('Newton')
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content('This is the first comment')
    end
  end
end
