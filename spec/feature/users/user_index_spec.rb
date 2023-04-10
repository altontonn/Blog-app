require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Newton',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: 'I love basketball',
      posts_counter: 1
    )
    visit users_path
  end

  it 'shows username of all other users' do
    visit users_path
    expect(page).to have_content('Newton')
  end

  it 'should show the profile picture for each user' do
    visit users_path
    expect(page).to have_css('img')
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of posts: 1')
  end

  it 'should redirect to user show page when clicked' do
    visit users_path
    click_link('Newton')
    expect(page).to have_content('Newton')
  end
end
