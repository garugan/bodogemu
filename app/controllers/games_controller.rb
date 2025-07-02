class GamesController < ApplicationController
  def new
  end

  def index
    @games = case params[:sort]
              when 'newest'
                Game.order(created_at: :desc)
              when 'name'
                Game.order(:title)
              when 'rating'
                Game
                  .left_joins(:reviews)
                  .select('games.*, AVG(reviews.rating) AS avg_rating')
                  .group('games.id')
                  .order(Arel.sql('AVG(reviews.rating) IS NULL, AVG(reviews.rating) DESC'))
             else
               Game.all
             end
  end

  def show
    @user = current_user
    @game = Game.find(params[:id])
    @genre = @game.genre
    @reviews = Review.all
  end

  def game_review
  end
end