class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :comments_counter
  belongs_to :post
  after_save :update_comments_counter

  def update_comments_counter
    post.update(comments_count: post.comments.size)
  end
end
