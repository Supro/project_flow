class EntitiesController < ApplicationController
  def new
    @form = EntityFormBuilder.new.build
  end

  def create
    service = EntityService.new(params)
    if service.save
      redirect_to root_path
    else
      @form = service.form
      render :new
    end
  end
end
