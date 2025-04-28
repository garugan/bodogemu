class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to game_path(@game)
    else
      @genre = Genre.find(@game.genre_id)
      @user = current_user
      @reviews = @game.reviews
      render 'games/show'
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find([:id])
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :game_id)
  end
end