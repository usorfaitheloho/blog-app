class LikesController < ApplicationController
    def new
        @likes = Likes.new
      end
end
