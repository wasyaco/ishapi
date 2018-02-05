require_dependency "ishapi/application_controller"
module Ishapi
  class UserProfilesController < ApplicationController

    def show
      @profile = IshModels::UserProfile.find_by :username => params[:username]
      authorize! :show, @profile
    end

  end
end
