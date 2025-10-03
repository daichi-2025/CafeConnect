class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def mypage
    @user = User.find(current_user.id)
  end

  def destroy
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_mypage_path(user.id)  
  end

  def edit
    @user = User.find(params[:id])
  end
end
