class Admin::DashboardsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!

  def users_index
    @users = User.all.order(created_at: :desc)
  end

  def users_show
    @user = User.find(params[:id])
    
  end

  def stores_index
    @stores = Store.all.order(created_at: :desc)
  end

  def posts_index
    @posts = Post.all.order(created_at: :desc)
  end

  def mypages
    @admin = current_admin
  end

  def posts_show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def stores_show
    @store = Store.find(params[:id])
    @store_name = @store.store_name
    @store_image = @store.store_image
    @post = Post.new
    @posts = @store.posts.order(created_at: :desc)
  end

  def edit
    @admin = current_admin
  end

  def update
    admin = current_admin
    admin.update(admin_params)
    redirect_to admin_mypages_dashboards_path(admin.id)  
  end

  private
  
  def admin_params
    params.require(:admin).permit(:admin_name, :email, :admin_image)    
  end
end
