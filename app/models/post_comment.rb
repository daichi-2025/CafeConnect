class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  belongs_to :store, optional: true

  validates :comment, presence: true
end
