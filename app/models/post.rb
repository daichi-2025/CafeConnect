class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :store
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  #validates :post_image, presence: true
end
