require 'swagger_helper'

RSpec.describe 'blog', type: :request do
  path '/api/v1/users' do
    get 'returns a list of users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users found' do
        schema type: :array,
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              photo: { type: :string },
              bio: { type: :string },
              posts_counter: { type: :string },
              created_at: { type: :string, format: 'date-time' },
              updated_at: { type: :string, format: 'date-time' }
            },
            required: [ 'id', 'name', 'photo', 'posts_counter', 'created_at', 'updated_at' ]
            let(:id) { Blog.create(name: 'Newton', photo: 'mango.jpeg', bio: 'good juice', posts_counter: 1).id }

        run_test!
      end

      response '401', 'Bad request' do
        let(:user) { { id: 3, name: 'Joyce' } } # missing required 'photo', 'bio', 'posts_counter' attribute
        run_test!
      end
    end
  end
  # Users posts
  path '/api/v1/users/1/posts' do
    get 'returns a list of posts' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'posts found' do
        schema type: :array,
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              text: { type: :string },
              user_id: { type: :integer }
            },
            required: [ 'id', 'title', 'text', 'user_id' ]
        run_test!
      end

      response '401', 'Bad request' do
        let(:post) { { id: 3, title: 'Hello' } } # missing required 'text' attribute
        run_test!
      end
    end
  end
  # User posts Comment
  path '/api/v1/users/1/posts/1/comments' do
    get 'returns a list of comments' do
      tags 'Comments'
      produces 'application/json'

      response '200', 'comments found' do
        schema type: :array,
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              user_id: { type: :integer },
              post_id: { type: :integer }
            },
            required: [ 'id', 'text', 'user_id', 'post_id' ]
        run_test!
      end

      response '401', 'Bad request' do
        let(:comment) { { id: 3, text: 'nice idea', user_id: 1 } } # missing required 'post_id' attribute
        run_test!
      end
    end
  end
end
