require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    post 'Create a resservation' do
      tags 'reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :resservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          city: { type: :string },
          user_id: { type: :integer },
          classSubject_id: { type: :integer },
          start: { type: :string }
        },
        required: %w[date city user_id classSubject_id start]
      }
      response '201', 'resservation created' do
        let(:u1) do
          User.create(name: 'foo', email: 'bar', facebook: 'facebook', linkedin: 'linkedin', twitter: 'twitter').id
        end
        let(:c1) do
          ClassSubject.create(subject: 'math', description: 'math description here', price: 100, duration: 15,
                              image: 'math image url', tutorName: 'Hanna').id
        end

        let(:resservation) do
          { date: '2021-01-01', city: 'Cali', user_id: u1, classSubject_id: c1, start: '10:00' }
        end
        run_test!
      end
    end
    path '/reservations' do
      get 'Retrieves all reservations' do
        tags 'reservations'
        produces 'application/json', 'application/xml'
        response '200', 'reservations found' do
          schema type: :array,
                 properties: {
                   id: { type: :integer },
                   date: { type: :string },
                   city: { type: :string },
                   user_id: { type: :integer },
                   classSubject_id: { type: :integer },
                   start: { type: :string }
                 },
                 required: %w[id date city user_id classSubject_id start]
          run_test!
        end
      end
    end
    path '/reservations/{id}' do
      get 'Retrieves a resservation' do
        tags 'reservations'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
        response '200', 'resservation found' do
          schema type: :array,
                 properties: {
                   id: { type: :integer },
                   date: { type: :string },
                   city: { type: :string },
                   user_id: { type: :integer },
                   classSubject_id: { type: :integer }
                 },
                 required: %w[id date city user_id classSubject_id start]
          let(:id) do
            Reservation.create(date: '2021-01-01', city: 'Cali', user_id: 1, classSubject_id: 1).id
          end
          run_test!
        end
      end
    end
  end
end
