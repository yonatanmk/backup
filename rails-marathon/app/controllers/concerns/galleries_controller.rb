require 'Pry'

class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params['id'])
    @paintings = @gallery.paintings
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to @gallery, notice: 'Gallery added successfully.'
    else
      flash[:notice] = 'Invalid Gallery.'
      render :new
    end

  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :city, :state, :zip, :description)
  end

end
