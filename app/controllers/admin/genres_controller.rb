class Admin::GenresController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genre_path(@genre), notice: "ジャンルを追加しました"
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path, notice: 'ジャンルを削除しました。'
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genre_path(@genre), notice: 'ジャンルを更新しました'
    else
      render :edit
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end