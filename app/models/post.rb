class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :store
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :like_count, -> {
    left_joins(:likes)
    .group('posts.id')
    .order('COUNT(likes.id) DESC')
  }

  def user_liked_by?(user)
    likes.exists?(user_id: user&.id)
  end
  
  def store_liked_by?(store)
    likes.exists?(store_id: store&.id)
  end
end
