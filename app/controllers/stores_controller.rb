class StoresController < ApplicationController
  before_action :is_matching_login_store, only: [:edit, :update]

  def new
    @store = Store.new
    @post = Post.new
  end

  def index
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
    respond_to do |format|
      format.html do
        #@stores = Store.all
      end
      format.json do
        @stores = Store.all.map do |store|
          url = Rails.application.routes.url_helpers.rails_representation_url(store.store_image.variant({}), only_path: true)
          store.image = url
          store
        end
      end
    end
  end

  def show
    @store = Store.find_by(id: params[:id])
    if @store
      @store_name = @store.store_name
      @store_image = @store.store_image
      @post = Post.new
      @posts = @store.posts.order(created_at: :desc)
    else
      render 'maps/show'
    end
    #@store = Store.find(params[:id])
    #@store_name = @store.store_name
    #@store_image = @store.store_image
    #@post = Post.new
    #posts = @store.posts.order(created_at: :desc)
  end

  def create
  end

  def mypage
    @post = Post.new
    @posts = current_store.posts.order(created_at: :desc)
    @store = Store.find(current_store.id)
  end

  def destroy
    store = Store.find(current_store.id)  
    store.destroy  
    redirect_to top_path
  end

  def update
    store = Store.find(params[:id])
    if store.update(store_params)
      redirect_to stores_mypage_path(store.id)  
    else
      @store = Store.find(current_store.id)
      render "stores/edit"
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def favorites
    @store = Store.find(params[:id])
    @users = @store.favorite_users
  end

  def likes 
    @store = Store.find(params[:id])
    likes = Like.where(store_id: @store.id).pluck(:post_id)
    @like_posts = Post.find(likes)
    @post = Post.find(params[:id])
  end

  private
  def store_params
    params.require(:store).permit(:store_image, :store_name, :email, :phone_number, :address, :store_url, :store_info)
  end

  def is_matching_login_store
    store = Store.find(params[:id])
    unless current_store == store
      redirect_to posts_path, alert: "権限がありません"
    end
  end
end
