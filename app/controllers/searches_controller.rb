class SearchesController < ApplicationController
  def search
    @user = current_user
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Review.search_for(@content, @method)
    end
  end
end
