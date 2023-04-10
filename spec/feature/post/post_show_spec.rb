require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before do
    @user1 = User.create(name: 'Ellon', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Nigeria')
    @user2 = User.create(name: 'Hassan', photo: 'https://picsum.photos/200/300', bio: 'Software Engineer from Morocco')
    @post1 = Post.create(author: @user2, title: 'Hello', text: 'Hello World!')
    @post2 = Post.create(author: @user2, title: 'Howdy', text: 'This is test post.')

    Comment.create(author: @user1, post: @post1, text: 'Sure. Great reminder, thanks!')
    Comment.create(author: @user1, post: @post1, text: 'So relevant. Keep it up!')
    Like.create(author: @user1, post: @post1)
    Like.create(author: @user2, post: @post1)

    visit user_post_path(@user2, @post1)
  end

  it "displays the post's title" do
    expect(page).to have_content(@post1.title)
  end

  it "displays the post's author" do
    expect(page).to have_content(@post1.author.name)
  end

  it 'displays the number of comments on the post' do
    expect(page).to have_content("Comments: #{@post1.comments_counter}")
  end

  it 'displays the number of likes on the post' do
    expect(page).to have_content("Likes: #{@post1.likes_counter}")
  end

  it "displays the post's body" do
    expect(page).to have_content(@post1.text)
  end

  it "displays each commentor's username" do
    @post1.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it "displays each commentor's comment" do
    @post1.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
