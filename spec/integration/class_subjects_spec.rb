require 'swagger_helper'

RSpec.describe 'class_subjects', type: :request do
  path '/class_subjects' do
    post 'Create a class_subject' do
      tags 'class_subjects'
      consumes 'application/json', 'application/xml'
      parameter name: :class_subject, in: :body, schema: {
        type: :object,
        properties: {
          subject: { type: :string },
          description: { type: :string },
          price: { type: :integer },
          duration: { type: :integer },
          image: { type: :string },
          tutorName: { type: :string }
        },

        required: %w[subject description price duration image tutorName]
      }
      response '201', 'class_subject created' do
        let(:class_subject) do
          { subject: 'math', description: 'math description here', price: 100, duration: 15, image: 'math image url',
            tutorName: 'Hanna' }
        end
        run_test!
      end
    end

    path '/class_subjects' do
      get 'Retrieves all class_subjects' do
        tags 'class_subjects'
        produces 'application/json', 'application/xml'
        response '200', 'class_subjects found' do
          schema type: :array,
                 properties: {
                   id: { type: :integer },
                   subject: { type: :string },
                   description: { type: :string },
                   price: { type: :integer },
                   duration: { type: :integer },
                   image: { type: :string },
                   tutorName: { type: :string }
                 },
                 required: %w[id subject description price duration image tutorName]
          run_test!
        end
      end
    end
    path '/class_subjects/{id}' do
      get 'Retrieves a class_subject' do
        tags 'class_subjects'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
        response '200', 'class_subject found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   subject: { type: :string },
                   description: { type: :string },
                   price: { type: :string },
                   duration: { type: :integer },
                   image: { type: :string },
                   tutorName: { type: :string }
                 },
                 required: %w[id subject description price duration image tutorName]
          let(:id) do
            ClassSubject.create(subject: 'math', description: 'math description here', price: 100, duration: 15, image: 'math image url',
                                tutorName: 'Hanna').id
          end
          run_test!
        end
      end
    end
    path '/class_subjects/{id}' do
      get 'Delete a class_subject' do
        parameter name: :id, in: :path, type: :string
        response '200', 'class_subject deleted' do
          let(:id) do
            ClassSubject.create(subject: 'math', description: 'math description here', price: 100, duration: 15, image: 'math image url',
                                tutorName: 'Hanna').id
          end
          run_test!
        end
      end
    end
  end
end
