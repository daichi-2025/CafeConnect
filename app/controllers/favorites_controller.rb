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

  # def index
  #   @store = Store
  #   @user = surrent_store.favorited_users 
  # end
end