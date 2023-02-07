require 'rails_helper'

RSpec.describe 'index', type: :feature do
  before :each do
    @user1 = User.create(
      Name: 'Richard',
      Photo: 'volvo.jpg',
      Bio: 'Teacher from England',
      PostsCounter: 0
    )
  end

  scenario 'shows the all username content' do
    visit '/users'
    expect(page).to have_content(@user1.Name)
  end

  scenario 'shows number of posts each user has written.' do
    visit '/users'
    expect(page).to have_content(@user1.PostsCounter)
  end

  scenario 'shows the profile picture for each user' do
    visit '/users'
    expect(page).to have_css('img')
  end

  scenario 'redirected to that user\'s show page' do
    visit '/users'
    click_link(@user1.Name)
    expect(page).to have_current_path(user_path(id: @user1.id))
  end
end
