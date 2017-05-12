require_dependency "ishapi/application_controller"
module Ishapi
  class ReportsController < ApplicationController

    def show
      @report = Report.find_by :name_seo => params[:name_seo]
    end

  end
end
