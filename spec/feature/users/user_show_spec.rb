require 'rails_helper'

RSpec.describe 'index', type: :feature do
  before(:each) do
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
    visit user_path(@user)
  end

  scenario 'shows the profile picture for each user' do
    visit user_path(@user)
    expect(page).to have_css('img')
  end

  scenario 'shows the all username content' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  scenario 'shows number of posts each user has written.' do
    visit user_path(@user)
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'shows user\'s. bio' do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  scenario 'shows user\'s first three posts' do
    visit user_path(@user)
    posts = @user.three_recent_post
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  scenario 'shows button that lets user view all of a user\'s posts.' do
    visit user_path(@user)
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end

  scenario 'redirects me to that post\'s show page' do
    visit user_path(@user)
    click_link(@post.title)
    expect(page).to have_current_path(user_post_path(@user, @post))
  end

  scenario 'redirected to that user\'s show page' do
    visit user_path(@user)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
