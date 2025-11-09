class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    if current_user
      like = current_user.likes.new(post_id: post.id)
      like.save
    elsif current_store
      like = current_store.likes.new(post_id: post.id)
      like.save
    end
    redirect_to request.referer
  end
  
  def destroy
    post = Post.find(params[:post_id])
    if current_user
      like = current_user.likes.find_by(post_id: post.id)
    elsif current_store
      like = current_store.likes.find_by(post_id: post.id)
    end

    if like
      like.destroy
    end
    
    redirect_to request.referer
  end
end
