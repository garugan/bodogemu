class ReviewCommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.review_comments.new(review_comment_params)
    @comment.review_id = @review.id
    if @comment.save
      redirect_to game_review_path(@game, @review)
    else
      render 'reviews/show'
    end
  end

  def destroy
    @comment = ReviewComment.find(params[:id])
    comment.destroy
  end

  def index
    @comment = ReviewComment.all
  end

  private
  
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end


