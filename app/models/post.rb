class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter

  validates :title, presence: true, length: {maximum: 250}
  validates :text, presence: true
  validates :comments_counter, numericity: {only_integer: true, :greater_than_or_equal_to: 0}
  validates :likes_counter, numericity: {only_integer: true, :greater_than_or_equal_to: 0}

  def update_posts_counter
    user.update(posts_counter: user.posts.size)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
