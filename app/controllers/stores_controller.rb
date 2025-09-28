class StoresController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
    @store_name = @store.store_name
    @store_images = @store.store_images

  end

  def create
    
  end

  def mypage
    @post = Post.new
    @posts = Post.all
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
