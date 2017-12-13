require_dependency "ishapi/application_controller"
module Ishapi
  class GalleriesController < ApplicationController

    def index
      @galleries = Gallery.all
      authorize! :index, Gallery
      if params[:cityname]
        city = City.find_by :cityname => params[:cityname]
        @galleries = @galleries.where( :city => city )
      end
      @galleries = @galleries.page( params[:galleries_page] ).per( 10 )
    end

    def show
      @gallery = ::Gallery.unscoped.find_by :galleryname => params[:galleryname]
      authorize! :show, @gallery
    end

  end
end
