require_dependency "ishapi/application_controller"
module Ishapi
  class SitesController < ApplicationController

    def index
      @sites = ::Site.all
    end

    def show
      if params[:domain].include?(".json")
        domain = params[:domain][0...-5]
      else
        domain = params[:domain]
      end
      @site = ::Site.find_by :domain => domain, :lang => :en
    end

  end
end
