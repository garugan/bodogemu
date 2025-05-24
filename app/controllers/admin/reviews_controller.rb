class Admin::ReviewsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path, notice: 'レビューを削除しました。'
  end
end
