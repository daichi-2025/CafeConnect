class Admin::StoresController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!

  def index
    @stores = Store.all.order(created_at: :desc)
    @stores = Store.all.order(created_at: :desc)
    if params[:latest]
      @stores = Store.latest
    elsif params[:old]
      @stores = Store.old
    elsif params[:star_count]
      @stores = Store.star_count
    else
      @stores = Store.all
    end
  end

  def show
    @store = Store.find(params[:id])
    @store_name = @store.store_name
    @store_image = @store.store_image
    @post = Post.new
    @posts = @store.posts.order(created_at: :desc)
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to admin_stores_path, notice: '店舗を削除しました。'
  end

  def favorites
    @store = Store.find(params[:id])
    @users = @store.favorite_users
  end
end
