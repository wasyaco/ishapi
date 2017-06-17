require_dependency "ishapi/application_controller"
module Ishapi
  class VenuesController < ApplicationController

    def index
      authorize! :index, ::Venue
      @venues = ::Venue.all
    end

    def show
      @venue = Venue.find_by :name_seo => params[:venuename]
      authorize! :show, @venue
    end

  end
end
