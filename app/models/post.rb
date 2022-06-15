class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

end
