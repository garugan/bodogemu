class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to game_review_path(@game, @review)
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
    @user = current_user
    @review = Review.find(params[:id])
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
    @game = @review.game
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to game_review_path(review.game, review)
  end

  def destroy
    review = Review.find(params[:id])
    game = review.game
    review.destroy
    redirect_to game_path(game)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :game_id)
  end
end