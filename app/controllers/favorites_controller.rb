class FavoritesController < ApplicationController
  def create
    store = Store.find(params[:store_id])
    if current_user
      favorite = current_user.favorites.new(store_id: store.id)
      favorite.save
    elsif current_store
      favorite = current_store.favorites.new(store_id: store.id)
      favorite.save
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    store = Store.find(params[:store_id])
    if current_user
      favorite = current_user.favorites.find_by(store_id: store.id)
      favorite.destroy
    elsif urrent_store
      favorite = current_store.favorites.find_by(store_id: store.id)
     favorite.destroy
    else
      redirect_to request.referer
    end
  end

  # def index
  #   @store = Store
  #   @user = surrent_store.favorited_users 
  # end
end