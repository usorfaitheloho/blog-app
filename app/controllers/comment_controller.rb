class CommentController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    if @comment.save
      flash[:success] = 'New comment saved successfully'
      redirect_to user_posts_path(user, post)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  def comment_params
    params.permit(:text)
  end
end
