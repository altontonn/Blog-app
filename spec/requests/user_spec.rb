require 'rails_helper'

RSpec.describe 'Routes', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get users_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Users')
      expect(response).to render_template(:index)
    end
  end

  describe 'users#show' do
    it 'returns a users record!' do
      get '/users/14'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Username')
      expect(response).to render_template(:show)
    end
  end
end
