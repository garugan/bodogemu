class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @games = @genre.games
  end

  def index
    @genres = Genre.left_joins(:games)
                    .select('genres.*, COUNT(games.id) as games_count')
                    .group('genres.id')
  end
end
