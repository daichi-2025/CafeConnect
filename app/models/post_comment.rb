class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :post_image
end
