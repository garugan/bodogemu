class GamesController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @games = Game.all
  end

  def show
  end

  def game_review
  end
end
