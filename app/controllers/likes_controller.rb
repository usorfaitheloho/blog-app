class LikesController < ApplicationController
    def new
        @likes = Likes.new
      end

      def create
        @post = Post.includes(:user, comments: [:user]).find(:id)
        @post_author = @post.user
    
        @user = current_user
    
        @liked_posts_by_user = Like.where(user: @user, post: @post)
    
        destroy && return if @liked_posts_by_user.present?
    
        @like = Like.create(user: @user, post: @post)
    
        return unless @like.save
    
        flash[:success] = 'You have liked this post'
        redirect_to @like
      end
end
