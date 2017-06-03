class HomeController < ApplicationController
  def index
    @view = IndexObject.new
  end
end
