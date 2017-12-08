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
      if params[:domain]
        site = Site.find_by :domain => params[:domain], :lang => :en
        @reports = @reports.where( :site_id => site.id )
      end

      @reports = @reports.page( params[:reports_page] ).per( 10 )
    end

  end
end
