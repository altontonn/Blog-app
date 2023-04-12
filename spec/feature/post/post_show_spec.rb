require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 1
    )

    @post = Post.create(
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 3,
      likes_counter: 4,
      user_id: @user.id
    )

    @first_comment = Comment.create(
      post_id: @post.id,
      user_id: @user.id,
      text: 'Yeah it is'
    )

    @like = Like.create(user_id: @user.id, post_id: @post.id)
    visit user_post_path(@user, @post)
  end

  it "displays the post's title" do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.title)
  end

  it "displays the post's author" do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of comments on the post' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.comments_counter)
  end

  it 'displays the number of likes on the post' do
    expect(page).to have_content(@post.likes_counter)
  end

  it "displays the post's body" do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.text)
  end

  it "displays each commentor's username" do
    visit user_post_path(@user, @post)
    @post.comments.each do |comment|
      expect(page).to have_content(comment.user.name)
    end
  end

  it "displays each commentor's comment" do
    visit user_post_path(@user, @post)
    @post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
