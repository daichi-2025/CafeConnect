class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = current_store.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @posts = current_store.posts.order(created_at: :desc)
      @store = Store.find(current_store.id)
      render "stores/mypage"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to stores_mypage_path(@post.id)  
    else
      render "posts/edit"
    end
  end

  def destroy
    post = Post.find(params[:id])  
    post.destroy  
    redirect_to stores_mypage_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image)    
  end
end
