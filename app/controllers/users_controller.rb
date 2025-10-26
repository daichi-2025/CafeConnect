class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end

  def create
  end

  def mypage
    @user = User.find(current_user.id)
  end

  def destroy
    user = User.find(current_user.id)  
    user.destroy  
    redirect_to new_user_registration_path
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_mypage_path(user.id)  
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:user_image, :name, :email)    
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless current_user == user
      redirect_to posts_path, alert: "権限がありません"
    end
  end
end
