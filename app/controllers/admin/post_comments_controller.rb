class Admin::PostCommentsController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!

  def destroy
    post_comment = PostComment.find(params[:id])
    post = post_comment.post
    post_comment.destroy  
    redirect_to admin_post_path(post), notice: 'コメントを削除しました。'
  end
end
