class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Store.search_for(@content, @method)
    end
      render :search_result
  end
end