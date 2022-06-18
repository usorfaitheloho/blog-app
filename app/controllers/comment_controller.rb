class CommentController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        new_comment.author_id = user.id
        new_comment.post_id = post.id
        if @comment.save
            flash[:success] = "New comment saved successfully"
              redirect_to @comment
        else
            flash.now[:error] = "Error: Comment could not be saved"
                 render :new, status: :unprocessable_entity
        end
    end
    
  def comment_params
    params.require(:comment).permit(:text)
  end
end
