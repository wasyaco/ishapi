require_dependency "ishapi/application_controller"

module Ishapi
  class UsersController < ApplicationController
    before_action :set_profile, :only => [ :fb_sign_in, :show ]

    def fb_sign_in
      authorize! :fb_sign_in, Ishapi
      # render :json => { :status => :ok }
      render :action => 'show'
    end

    def show
      authorize! :fb_sign_in, Ishapi
    end

  end
end
