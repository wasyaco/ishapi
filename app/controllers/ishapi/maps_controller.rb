require_dependency "ishapi/application_controller"
module Ishapi
  class MapsController < ApplicationController

    def index
      authorize! :index, ::Gameui::Map
      @maps = ::Gameui::Map.all
    end

    def show
      @map = ::Gameui::Map.find_by slug: params[:slug]
      authorize! :show, @map
    end

  end
end
