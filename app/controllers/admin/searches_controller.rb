class Admin::SearchesController < ApplicationController
  layout 'admin' 
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Store.search_for(@content, @method)
    end
      render :search_result
  end
end