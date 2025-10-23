class AdminsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def mypage
    @admin = Admin.find(current_admin.id)
  end

  def destroy
    admin = Admin.find(current_admin.id)  
    admin.destroy  
    redirect_to new_user_registration_path
  end

  def update
  end

  def edit
  end

  private
  def admin_params
    params.require(:admin).permit(:admin_name, :email)    
  end
end
