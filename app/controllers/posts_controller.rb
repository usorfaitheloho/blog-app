class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = Post.includes(:user).where(user: params[:user_id]).references(:user)
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
