require_dependency "ishapi/application_controller"
module Ishapi
  class ReportsController < ApplicationController

    def show
      @report = Report.unscoped.find_by :name_seo => params[:name_seo]
      authorize! :show, @report
    end

  end
end
