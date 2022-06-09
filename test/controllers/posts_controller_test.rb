require 'test_helper'

class UsersController < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_index_url
    assert_response :success
  end
end
