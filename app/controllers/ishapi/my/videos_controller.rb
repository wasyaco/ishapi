
module Ishapi
  module My
    class VideosController < Ishapi::My::MyController

      def index
        authorize! :my_index, Video
        @videos = @current_user.profile.videos.unscoped.where( is_trash: false ).order_by( created_at: :desc ).limit(20)
      end

    end
  end
end

