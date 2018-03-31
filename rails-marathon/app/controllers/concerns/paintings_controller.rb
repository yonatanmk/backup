require 'Pry'

class PaintingsController < ApplicationController

  def new
    @painting = Painting.new
    @gallery = Gallery.find(params['gallery_id'])
  end

  def create
    @gallery = Gallery.find(params['gallery_id'])
    @painting = Painting.new(painting_params)

    @painting.gallery = @gallery

    if @painting.save
      redirect_to @gallery, notice: 'Painting added successfully.'
    else
      flash[:notice] = 'Invalid Painting.'
      render :new
    end

  end

  private

  def painting_params
    params.require(:painting).permit(:title, :artist, :year)
  end

end
