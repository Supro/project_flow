class EntitiesController < ApplicationController
  def new
    @form = EntityFormBuilder.new
  end

  def create
    service = EntityService.new(params)
    if service.save
      redirect_to index_path
    else
      @form = service.form
      render :new
    end
  end
end
