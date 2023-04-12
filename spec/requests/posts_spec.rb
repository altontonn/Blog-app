require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'return http success' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end

    it 'return body posts' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_posts_path(user)
      expect(response.body).to include('Posts')
    end

    it 'return index template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'return http success' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      post = Post.create(user:, title: 'Hello', text: 'This is my second post ', comments_counter: 2,
                         likes_counter: 2)
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'return correct body post text' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      post = Post.create(user:, title: 'Hello', text: 'This is my second post ', comments_counter: 2,
                         likes_counter: 2)
      get user_post_path(user, post)
      expect(response.body).to include('This is my second post')
    end

    it 'return show template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      post = Post.create(user:, title: 'Hello', text: 'This is my second post ', comments_counter: 2,
                         likes_counter: 2)
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
