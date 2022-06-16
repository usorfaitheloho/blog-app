class UsersController < ApplicationController
  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def user_params
    params.require(:user).permit(:Name, :Bio, :Photo, :PostsCounter)
  end
end
