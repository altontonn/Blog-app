require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns all posts' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
      expect(response.body).to include('Posts')
      expect(response).to render_template(:index)
    end
  end

  describe 'posts#show' do
    it 'returns a user posts!' do
      get '/users/1/posts/6'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('This is my second post')
      expect(response).to render_template(:show)
    end
  end
end
