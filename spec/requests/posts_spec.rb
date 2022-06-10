require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    context 'GET /index' do
        it 'should return the correct response' do
            get '/users/users/posts'
            expect(response).to have_http_status(200)
        end
    end

    context 'GET /index' do
        it 'should return the correct body' do
            get '/users/users/posts'
             expect(response.body).to include('See Blog Posts')
        end
    end
    
    context 'GET /index' do
        it 'should return the correct template' do
            get '/users/users/posts'
            expect(response).to render_template(:index)
        end
    end

    context 'GET /show' do
        it 'should return the correct response' do
            get '/users/user/posts/post'
            expect(response).to have_http_status(200)
        end
    end

    context 'GET /show' do
        it 'should return the correct body' do
            get '/users/user/posts/post'
             expect(response.body).to include('Posts available for a user')
        end
    end

    context 'GET /show' do
        it 'should return the correct template' do
            get '/users/user/posts/post'
            expect(response).to render_template(:show)
        end
    end
    
end