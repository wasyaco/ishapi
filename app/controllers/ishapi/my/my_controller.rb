
module Ishapi
  module My
    class MyController < Ishapi::ApplicationController

      before_action :set_profile

      private

      def set_profile
        begin
          @graph   = Koala::Facebook::API.new( params[:accessToken] )
          me       = @graph.get_object( 'me', :fields => 'email' )
          @profile = IshModels::UserProfile.find_by :email => me['email']
        rescue Koala::Facebook::AuthenticationError => e
          render :json => { :status => :not_ok, :errors => "Probably expired token." }
          return
        end
      end

    end
  end
end

