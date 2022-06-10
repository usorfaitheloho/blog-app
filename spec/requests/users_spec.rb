require 'rails_helper'

RSpec.describe 'Users', type: :request do
    context 'GET /index' do
        it 'should return the correct response' do
            get '/users'
            expect(response).to have_http_status(200)
        end
    end

    context 'GET /index' do
        it 'should return the correct body' do
            get '/users'
             expect(response.body).to include('Welcome to the blog')
        end
    end
    
    context 'GET /index' do
        it 'should return the correct template' do
            get '/users'
            expect(response).to render_template(:index)
        end
    end

    context 'GET /show' do
        it 'should return the correct response' do
            get '/users/show'
            expect(response).to have_http_status(200)
        end
    end

    context 'GET /show' do
        it 'should return the correct body' do
            get '/users/show'
             expect(response.body).to include('User profile')
        end
    end

    context 'GET /show' do
        it 'should return the correct template' do
            get '/users/show'
            expect(response).to render_template(:show)
        end
    end
    
end
