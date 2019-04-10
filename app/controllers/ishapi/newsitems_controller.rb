require_dependency "ishapi/application_controller"

module Ishapi
  class NewsitemsController < ApplicationController

    before_action :check_profile # , except: [ :index ] # @TODO: this is fucked
    # before_action :check_multiprofile, only: [ :index ]

    def index
      if params[:domain]
        resource = Site.find_by( :domain => params[:domain], :lang => :en )
      else
        resource = current_user.profile
      end

      authorize! :show, resource
      @newsitems = current_user.profile.newsitems
    end

  end
end
