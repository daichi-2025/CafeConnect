class FavoritesController < ApplicationController
  def create
    store = Store.find(params[:store_id])
    if current_user
      favorite = current_user.favorites.new(store_id: store.id)
      favorite.save
    end
      redirect_to request.referer
  end
  
  def destroy
    store = Store.find(params[:store_id])
    if current_user
      favorite = current_user.favorites.find_by(store_id: store.id)
      favorite.destroy
    end
      redirect_to request.referer
  end

  def index
    @store = current_store
    @users = @store.favorite_users
  end
end