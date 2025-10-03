class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def mypage
    @user = user.find(current_user.id)
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
