require_dependency "ishapi/application_controller"

module Ishapi
  class MeasurementsController < ApplicationController
    before_action :check_profile, :only => [ :update ]

    def update
      authorize! :update_measurements, CoTailors::Order
      flag = @current_profile.measurement.update_attributes params[:measurement].permit( CoTailors::Order::MEASUREMENT_PARAMS )

      # byebug

      if flag
        render :json => { :status => :ok }
      else
        render :json => { :status => :not_ok, :error => @current_profile.measurement.errors.messages }
      end
    end

    #
    # private
    #
    private

  end
end
