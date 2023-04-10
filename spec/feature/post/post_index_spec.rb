require 'rails_helper'

RSpec.describe 'Posts index ', type: :feature do
  before do
    @user1 = User.create(name: 'Ellon', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Nigeria')
    @user2 = User.create(name: 'Hassan', photo: 'https://picsum.photos/200/300', bio: 'Software Engineer from Morocco')
    @post1 = Post.create(author: @user2, title: 'Hello', text: 'Hello World!')
    @post2 = Post.create(author: @user2, title: 'Howdy', text: 'This is test post.')
    @comment1 = Comment.create(author: @user1, post: @post1, text: 'Sure. Great reminder, thanks!')
    Comment.create(author: @user1, post: @post1, text: 'So relevant. Keep it up!')

    visit user_posts_path(@user2)
  end

  it 'displays profile picture' do
    expect(page).to have_css('img')
  end

  it 'displays username' do
    expect(page).to have_content(@user2.name)
  end

  it 'displays the number of posts' do
    expect(page).to have_content("Number of posts: #{@user2.posts_counter}")
  end

  it 'displays the posts title ' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
  end

  it 'displays the body of the posts ' do
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post2.text)
  end

  it 'displays the first comment ' do
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment1.text)
  end

  it 'displays the number of comments ' do
    expect(page).to have_content("Comments: #{@post1.comments_counter}")
    expect(page).to have_content("Comments: #{@post2.comments_counter}")
  end

  it 'displays the number of likes for a post ' do
    expect(page).to have_content("Likes: #{@post1.likes_counter}")
    expect(page).to have_content("Likes: #{@post2.likes_counter}")
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_css('.will-paginate-container ')
  end

  it "redirects to a post's show page when clicked" do
    click_link('Hello')
    expect(page).to have_current_path(user_post_path(@user2, @post1))
  end
end
