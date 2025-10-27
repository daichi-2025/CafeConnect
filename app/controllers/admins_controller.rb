class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def mypage
    @admin = current_admin
  end

  def destroy
    
  end

  def update
  end

  def edit
  end

  # private
  # def admin_params
  #   params.require(:admin).permit(:admin_name, :email)    
  # end
end
