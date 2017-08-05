require_dependency "ishapi/application_controller"
module Ishapi
  class ReportsController < ApplicationController

    def show
      @report = Report.unscoped.find_by :name_seo => params[:name_seo]
      authorize! :show, @report
    end

    def index
      authorize! :index, Report
      @reports = Report.all
      if params[:cityname]
        city = City.find_by :cityname => params[:cityname]
        @reports = @reports.where( :city_id => city.id )
      end
    end

  end
end
