class Admin::TagsearchesController < ApplicationController
  layout 'admin' 
  def search
    @model = Post 
    @word = params[:content]  
    @posts = Post.where("category LIKE ?","%#{@word}%")
    render :tagsearch_result
  end
end