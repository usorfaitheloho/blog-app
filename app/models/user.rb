class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :posts_counter, numericity: {only_integer: true, :greater_than_or_equal_to: 0}
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
