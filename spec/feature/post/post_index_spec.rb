require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Newton',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: 'I am cool',
      posts_counter: 2
    )
    visit user_posts_path(@user)
    @first_post = Post.create(
      title: 'Hello',
      text: 'this is my first post',
      comments_counter: 1,
      likes_counter: 2,
      user_id: @user.id
    )
    @second_post = Post.create(
      title: 'Hey There',
      text: 'this is my first post',
      comments_counter: 2,
      likes_counter: 3,
      user_id: @user.id
    )
    @first_comment = Comment.create(
      post_id: @first_post.id,
      user_id: @user.id,
      text: 'nice idea'
    )
  end

  it 'displays profile picture' do
    expect(page).to have_css('img')
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'displays the posts title' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@second_post.title)
  end

  it 'displays the body of the posts ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@second_post.text)
  end

  it 'displays the first comment ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_comment.text)
  end

  it 'displays the number of comments ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.comments_counter)
    expect(page).to have_content(@second_post.comments_counter)
  end

  it 'displays the number of likes for a post ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.likes_counter)
    expect(page).to have_content(@second_post.likes_counter)
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_css('.paginate')
  end

  it "redirects to a post's show page when clicked" do
    visit user_posts_path(@user)
    click_link('Hello')
    expect(page).to have_current_path(user_post_path(@user, @first_post))
  end
end
