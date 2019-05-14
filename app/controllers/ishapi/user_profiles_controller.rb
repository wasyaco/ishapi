require_dependency "ishapi/application_controller"
module Ishapi
  class UserProfilesController < ApplicationController

    before_action :check_profile

    def show
      @profile = IshModels::UserProfile.find_by :username => params[:username]
      authorize! :show, @profile
    end

    def my
      @profile = current_user.profile
      authorize! :show, @profile
    end

  end
end
