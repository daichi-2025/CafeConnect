class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :store
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  #validates :post_image, presence: true

  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
