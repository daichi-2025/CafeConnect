class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    if current_user
      comment = current_user.post_comments.new(post_comment_params)
    elsif current_store
      comment = current_store.post_comments.new(post_comment_params)
    end
    comment.post_id = post.id

    if comment.save
      redirect_to post_path(post), notice: 'コメントが投稿されました。'
    else
      # 保存失敗時は投稿詳細に戻りつつ、エラーメッセージを表示したい場合
      @post = post
      # 例えば新たにコメント投稿用のインスタンス変数も用意しておく
      @post_comment = comment
      flash.now[:alert] = 'コメントを入力してください。'
      render 'posts/show' # 投稿詳細画面をレンダリング(ビュー名は適宜調整してください)
    end
  end

  def destroy
    post_comment = PostComment.find(params[:id])  
    post = post_comment.post
    post_comment.destroy  
    redirect_to post_path(post)
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
