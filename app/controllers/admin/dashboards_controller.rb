class Admin::DashboardsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
  def users_index
    @users = User.all
  end

  def stores_index
    @stores = Store.all
  end

  def posts_index
    @posts = Post.all
  end

  def mypages
    @admin = current_admin
  end

  def posts_show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  private
  
  def admin_params
    params.require(:admin).permit(:admin_name, :email)    
  end
end
