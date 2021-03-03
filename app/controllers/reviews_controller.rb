class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def create
    @review = Review.new(review_params)

    # we need `restaurant_id` to associate review with corresponding restaurant
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant = @review.restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
