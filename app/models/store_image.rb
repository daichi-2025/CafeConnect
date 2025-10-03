class StoreImage < ApplicationRecord
  has_one_attached :store_image
  belongs_to :store
end
