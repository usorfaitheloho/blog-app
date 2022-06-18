class CommentController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        new_comment = Comment.new(comment.permit(:text))
        new_comment.author_id = user.id
        new_comment.post_id = post.id
        if new_comment.save
            redirect_to user_post_url(user,post)
        else
            render :new
        end
    end
end
