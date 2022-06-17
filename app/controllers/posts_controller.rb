class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = Post.includes(:user).where(user: params[:user_id]).references(:user)
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end
end
