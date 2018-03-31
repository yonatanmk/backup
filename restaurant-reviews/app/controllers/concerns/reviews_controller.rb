require 'Pry'

class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params['restaurant_id'])
  end

  def create
    @restaurant = Restaurant.find(params['restaurant_id'])
    @review = Review.new(review_params)

    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant, notice: 'Review added successfully.'
    else
      flash[:notice] = 'Invalid Review.'
      render :new
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
