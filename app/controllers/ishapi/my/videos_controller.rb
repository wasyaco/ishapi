
module Ishapi
  module My
    class VideosController < Ishapi::My::MyController

      def index
        authorize! :my_index, Video
        puts! @current_user, 'current_user'

        @videos = @current_user.profile.videos.unscoped
      end

    end
  end
end

