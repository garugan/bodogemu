class GamesController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @games = Game.all
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