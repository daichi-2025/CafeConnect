class StoresController < ApplicationController
  def new
    @store = Store.new
    @post = Post.new
  end

  def index
    @stores = Store.all.order(created_at: :desc)
  end

  def show
    @store = Store.find(params[:id])
    @store_name = @store.store_name
    @store_images = @store.store_images
    @post = Post.new
    @posts = @store.posts.order(created_at: :desc)
  end

  def create
  end

  def mypage
    @post = Post.new
    @posts = current_store.posts.order(created_at: :desc)
    @store = Store.find(current_store.id)
  end

  def destroy
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to stores_mypage_path(store.id)  
  end

  def edit
    @store = Store.find(params[:id])
  end

  private
  def store_params
    params.require(:store).permit(:store_image, :store_name, :email, :phone_number, :address, :store_url, :store_info)
  end
end
