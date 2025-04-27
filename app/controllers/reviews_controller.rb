class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to '/games'
    else
      render :index
    end
  end

  def index
    @reviews = all
  end

  def show
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
