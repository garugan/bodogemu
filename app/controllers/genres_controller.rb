class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @games = @genre.games
  end

  def index
    @genres = Genre.all
  end
end
