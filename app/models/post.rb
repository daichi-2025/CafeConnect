class Post < ApplicationRecord
  has_one_attached :post_image
  belongs_to :store
  has_many :post_comments, dependent: :destroy
end
