class LikesController < ApplicationController
  def new
    @likes = Likes.new
  end

  def create
    @post = Post.includes(:user).find(params[:post_id])
    @post_author = @post.user

    @user = current_user

    @liked_posts_by_user = Like.where(user: @user, post: @post)

    @like = Like.create(user: @user, post: @post)

    return unless @like.save

    flash[:alert] = 'You have liked this post'
    redirect_back_or_to user_post_url(@post_author, @post)
  end
end
