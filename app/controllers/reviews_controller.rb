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
    @game = Game.find(params[:game_id])
    @review = @game.reviews.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to game_review_path
    end
    @game = @review.game
    @user = current_user
  end

  def update
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to game_review_path
    end
    @game = @review.game
    @user = current_user
    if @review.update(review_params)
      redirect_to game_review_path(@game, @review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    unless @review.user == current_user
      redirect_to game_review_path
    end
    game = @review.game
    @review.destroy
    redirect_to game_path(game)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :game_id)
  end
end