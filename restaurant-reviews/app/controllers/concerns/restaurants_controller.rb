require 'Pry'

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params['id'])
    @reviews = @restaurant.reviews
    @categories = @restaurant.categories
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.categories = Category.where(id: params[:restaurant][:categories])
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant added successfully.'
    else
      @categories = Category.all
      flash[:notice] = 'Invalid Restaurant.'
      render :new
    end

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
  end

end
