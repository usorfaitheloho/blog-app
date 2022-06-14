class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    private
    def recent_posts
        Post.order(created_at: :desc).limit(3)
    end
end
