class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def create
    post = current_store.posts.new(post_params)
    post.save
    redirect_to stores_mypage_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to stores_mypage_path(post.id)  
  end

  def destory
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image)    
  end
end
