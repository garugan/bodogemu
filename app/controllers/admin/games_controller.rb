class Admin::GamesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to admin_games_path notice: "ゲームを追加しました"
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path, notice: 'ゲームを削除しました。'
  end

  def index
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to admin_game_path(@game), notice: 'ゲームを更新しました'
    else
      render :edit
    end
  end


  private

  def game_params
    params.require(:game).permit(:title, :body, :genre_id, :image, :playtime, :player)
  end
end