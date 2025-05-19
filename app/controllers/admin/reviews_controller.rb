class Admin::ReviewsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end
end
