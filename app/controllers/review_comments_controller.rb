class ReviewCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.find(params[:review_id])
    @review_comment = current_user.review_comments.new(review_comment_params)
    @review_comment.review = @review
    if @review_comment.save
      respond_to do |format|
        format.html { redirect_to game_review_path(@game, @review) }
        format.js   # create.js.erb を探す
      end
    else
      respond_to do |format|
        format.html { render 'reviews/show' }
        format.js   # エラー用の JS を作ってもよい
      end
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = @review.review_comments.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to game_review_path(@review.game, @review), notice: "コメントを削除しました" }
      format.js   # destroy.js.erb を使う
    end
  end

  def index
    @comment = ReviewComment.all
  end

  private
  
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end


