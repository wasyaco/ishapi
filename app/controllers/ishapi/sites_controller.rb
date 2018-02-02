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

      @galleries    = @site.galleries.limit( 10 )
      @newsitems    = @site.newsitems.limit(10)
      @reports      = @site.reports.limit( 10 )
      @langs        = ::Site.where( :domain => domain ).map( &:lang )
      @feature_tags = @site.tags.where( :is_feature => true )
    end

  end
end
