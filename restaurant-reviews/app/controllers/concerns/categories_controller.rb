require 'Pry'

class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params['id'])
    @restaurants = @category.restaurants
  end

end
