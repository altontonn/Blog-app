require 'rails_helper'

RSpec.describe 'Routes', type: :request do
  describe 'GET /index' do
    it 'return http success' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get users_path(user)
      expect(response).to have_http_status(200)
    end

    it 'return body posts' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get users_path(user)
      expect(response.body).to include('Users')
    end

    it 'return index template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get users_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'return http success' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'return body posts' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response.body).to include('Username')
    end

    it 'return index template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                         posts_counter: 4)
      get user_path(user)
      expect(response).to render_template(:show)
    end
  end
end
