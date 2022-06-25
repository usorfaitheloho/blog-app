class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter
  after_save :update_likes_counter
  after_destroy :update_likes_counter

  private

  def update_likes_counter
    post.update!(likes_counter: post.likes.count)
  end
end
