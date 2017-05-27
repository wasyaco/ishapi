require_dependency "ishapi/application_controller"
module Ishapi
  class GalleriesController < ApplicationController

    def show
      @gallery = ::Gallery.unscoped.find_by :galleryname => params[:galleryname]
      authorize! :show, @gallery
    end

  end
end
