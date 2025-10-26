class TagsearchesController < ApplicationController
  def search
    @model = Post  #search機能とは関係なし
    @word = params[:content]  #content?→body?　posts.indexの記述も
    @posts = Post.where("category LIKE?","%#{@word}%")
    render "tagsearches/tagsearch"
  end
end
