class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  private

  def update_post_counter
    user.increment(:posts_counter)
  end

end
