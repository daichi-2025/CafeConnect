class TagsearchesController < ApplicationController
  def search
    @model = Post  #search機能とは関係なし
    @word = params[:content]  
    @posts = Post.where("category LIKE ?","%#{@word}%")
    render :tagsearch_result
  end
end