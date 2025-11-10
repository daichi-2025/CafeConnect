class Admin::AdminsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!

  def mypage
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def update
    admin = current_admin
    admin.update(admin_params)
    redirect_to admin_mypage_path  
  end

  private
  
  def admin_params
    params.require(:admin).permit(:admin_name, :email, :admin_image)    
  end
end
