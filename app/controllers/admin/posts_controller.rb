class Admin::PostsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end

end
