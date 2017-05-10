
require_dependency "ishapi/application_controller"

module Ishapi
  class CitiesController < ApplicationController

    def index
      @cities = City.all
    end

    def show
      @city = City.find_by :cityname => params[:cityname]
    end

  end
end
