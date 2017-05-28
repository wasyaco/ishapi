require_dependency "ishapi/application_controller"
module Ishapi
  class SitesController < ApplicationController

    def index
      authorize! :index, ::Site
      @sites = ::Site.all
    end

    def show
      if params[:domain].include?(".json")
        domain = params[:domain][0...-5]
      else
        domain = params[:domain]
      end
      @site = ::Site.find_by :domain => domain, :lang => :en
      authorize! :show, @site

      @newsitems = @site.newsitems.limit(10)
    end

  end
end
