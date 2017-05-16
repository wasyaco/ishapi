require_dependency "ishapi/application_controller"
module Ishapi
  class GalleriesController < ApplicationController

    def show
      @gallery = ::Gallery.find_by :galleryname => params[:galleryname]
    end

  end
end
