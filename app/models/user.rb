class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def recent_posts
    posts.order(created_at: :desc).includes(:user).limit(3)
  end
end
