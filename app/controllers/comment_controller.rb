class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params(post))

    if @comment.save
      flash[:alert] = 'New comment saved successfully'
      redirect_to user_posts_path
    else
      flash[:notice] = 'Error: Comment could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params(post)
    a_comment = params.require(:comment).permit(:text)
    a_comment[:user] = current_user
    a_comment[:post] = post
    a_comment
  end
end
