require_dependency "ishapi/application_controller"

module Ishapi
  class NewsitemsController < ApplicationController

    def index
      if params[:domain]
        resource = Site.find_by( :domain => params[:domain], :lang => :en )
      end
      authorize! :show, resource
      @newsitems = resource.newsitems.page( params[:newsitems_page] ).per( resource.newsitems_per_page )
    end

  end
end
