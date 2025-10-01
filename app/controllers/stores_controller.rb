class StoresController < ApplicationController
  def new
    @store = Store.new
    @post = Post.new
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
    @store_name = @store.store_name
    @store_images = @store.store_images
    @post = Post.new
    @posts = Post.all
  end

  def create
    
  end

  def mypage
    @post = Post.new
    @posts = Post.all
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

  def store_params
    params.require(:store).permit(:store_name, :email)
  end
end
