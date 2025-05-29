class SearchesController < ApplicationController
  def search
    @user = current_user
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    case @model
    when "user"
      @records = User.search_for(@content, @method)
    when "review"
      @records = Review.search_for(@content, @method)
    when "game"
      @records = Game.search_for(@content, @method)
    when "genre"
      @records = Genre.search_for(@content, @method)
    else
      @recors = []
    end
  end
end
