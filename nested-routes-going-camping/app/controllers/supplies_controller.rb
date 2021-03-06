class SuppliesController < ApplicationController
  def index
    @title = "All Supplies:"
    @supplies = Supply.all

    if params['camper_id']
      camper = Camper.find(params['camper_id'])
      @title = "Supplies Brought by #{camper.name} "
      @supplies = camper.supplies
    else
      @title = "All Supplies:"
      @supplies = Supply.all
    end
  end
end
