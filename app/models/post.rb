class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter

  def update_posts_counter
    user.update(posts_counter: user.posts.size)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
