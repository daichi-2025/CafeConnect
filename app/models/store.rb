class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :store_name, presence: true
  
  has_many :posts, dependent: :destroy
  has_one_attached :store_image
  has_many :favorites, dependent: :destroy

  def self.search_for(content, method)
    if method == 'perfect'
      Store.where(title: content)
    elsif method == 'forward'
      Store.where('store_name LIKE ?', content + '%')
    elsif method == 'backward'
      Store.where('store_name LIKE ?', '%' + content)
    else
      Store.where('store_name LIKE ?', '%' + content + '%')
    end
  end

  def get_store_image(width, height)
    unless store_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      store_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    store_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
