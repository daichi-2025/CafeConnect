class Admin::PostsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.order(created_at: :desc)
    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:like_count]
      @posts = Post.like_count
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: '投稿を削除しました。'
  end

  def likes
    @post = Post.find(params[:id])
    @users = @post.like_users
  end
end
