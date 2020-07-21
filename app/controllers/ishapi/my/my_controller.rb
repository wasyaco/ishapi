
module Ishapi
  module My
    class MyController < Ishapi::ApplicationController

      # before_action :set_profile # this is DoS on FB - disabled
      # before_action :do_login
      before_action :check_profile

      def account
        puts! params, 'my account'

        @profile = current_user.profile
        authorize! :show, @profile
      end


      private

      def do_login
        puts! params, 'params'

        token = decode(params[:jwtToken])
        puts! token, 'token'
        @current_user = User.find(token["user_id"])
      end

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

