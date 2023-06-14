require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          facebook: { type: :string },
          linkedin: { type: :string },
          twitter: { type: :string }
        },
        required: %w[name email]
      }

      response '201', 'user created' do
        let(:user) { { name: 'foo21', email: 'bar' } }
        run_test!
      end
    end

    path '/users' do
      get 'Retrieves all users' do
        tags 'Users'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'users found' do
          let(:id) do
            User.create(name: 'foo', email: 'bar', facebook: 'facebook', linkedin: 'linkedin', twitter: 'twitter').id
          end
          schema type: :aray,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string },
                   facebook: { type: :string },
                   linkedin: { type: :string },
                   twitter: { type: :string }
                 },
                 required: %w[id name email facebook linkedin twitter]

          run_test!
        end
      end
    end
  end
end
