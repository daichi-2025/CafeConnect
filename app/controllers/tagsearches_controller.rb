class TagsearchesController < ApplicationController
  def search
    @model = Post  #search機能とは関係なし
    @word = params[:content]  
    if @word.blank?
      @posts = []
    else
      @posts = Post.where("category LIKE ?","%#{@word}%")
    end
    render :tagsearch_result
  end
end
