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


      if @site.is_private
        if !params[:access_token]
          render :json => { :status => :unauthorized}, :status => :unauthorized
          return
        end
        access_token = params[:access_token]
        @graph = Koala::Facebook::API.new( access_token, ::FB[@site.domain][:secret] )
        @profile = @graph.get_object "me", :fields => 'email'
        if @site.private_user_emails.include?( @profile['email'] )
          ;
        else
          render :json => { :status => :unauthorized}, :status => :unauthorized
          render :status => :unauthorized
        end
      end

      @galleries    = @site.galleries.limit( 10 )
      @newsitems    = @site.newsitems.limit(10)
      @reports      = @site.reports.limit( 10 )
      @langs        = ::Site.where( :domain => domain ).map( &:lang )
      @feature_tags = @site.tags.where( :is_feature => true )

    end

  end
end
