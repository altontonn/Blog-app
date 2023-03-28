require 'rails_helper'

RSpec.describe 'Posts index ', type: :feature do
  before(:each) do
    @user = User.create(
      Name: 'Newton',
      Photo: 'https://i.imgur.com/9yG7zZT.jpg',
      Bio: 'I am cool',
      PostsCounter: 0
    )
    visit user_posts_path(@user)
    @first_post = Post.create(Title: 'Hello', Text: 'this is my first post', CommentsCounter: 0, LikesCounter: 0,
                              user_id: @user.id)
    @first_comment = Comment.create(post_id: @first_post.id, user_id: @user.id, Text: 'nice idea')
  end
  it 'displays profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css('img')
  end
  it 'displays username' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.Name)
  end
  it 'displays the number of posts' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.PostsCounter)
  end
  it 'displays the posts title ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.Title)
  end
  it 'displays the body of the posts ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.Title)
    expect(page).to have_content(@first_post.Text)
  end
  it 'displays the first comment ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_comment.Text)
  end
  it 'displays the number of comments ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.CommentsCounter)
  end
  it 'displays the number of likes for a post ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.LikesCounter)
  end

  it 'redirects post to the show page ' do
    visit user_posts_path(@user)
    click_link('See Post')
    expect(page).to have_content('User Post')
  end
end
