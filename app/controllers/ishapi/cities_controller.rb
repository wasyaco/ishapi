require_dependency "ishapi/application_controller"

module Ishapi
  class CitiesController < ApplicationController

    def index
      authorize! :index, City
      @cities = City.all
    end

    def features
      authorize! :index, City
      @cities = City.where( :is_feature => true )
    end

    def show
      @city = City.find_by :cityname => params[:cityname]
      authorize! :show, @city
    end

  end
end
