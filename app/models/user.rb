class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :post_comments, dependent: :destroy
  has_one_attached :user_image, dependent: :destroy
  
  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @user = User.where("name LIKE?", "#{word}")
  #   elsif search == "forward_match"
  #     @user = User.where("name LIKE?","#{word}%")
  #   elsif search == "backward_match"
  #     @user = User.where("name LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @user = User.where("name LIKE?","%#{word}%")
  #   else
  #     @user = User.all
  #   end
  # end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
  
  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end
end
