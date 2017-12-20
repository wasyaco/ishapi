require_dependency "ishapi/application_controller"

module Ishapi
  class ApiController < ApplicationController

    def home
      authorize! :welcome_home, Ishapi
      render :json => { :status => :ok, :message => 'Ishapi::ApiController.home', 
                        :n_reports => Report.count, :n_cities => City.count }
    end

  end
end
