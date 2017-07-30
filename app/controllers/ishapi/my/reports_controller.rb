
module Ishapi
  module My
    class ReportsController < Ishapi::My::MyController

      def index
        authorize! :my_index, Report
        @reports = @profile.reports
      end

    end
  end
end

