module Ishapi
  class ApplicationController < ActionController::Base
    protect_from_forgery :prepend => true, :with => :exception
    layout :false
    before_action :set_current_ability
    check_authorization
    skip_before_action :verify_authenticity_token

    #
    # private
    #
    private

    def set_profile
      accessToken   = request.headers[:accessToken]
      accessToken ||= params[:fb_long_access_token]
      accessToken ||= params[:accessToken] # if (params[:debug] == 'abba' && Rails.env.development?)

      params[:domain] ||= '_default'

      if accessToken
        begin
          @graph            = Koala::Facebook::API.new( accessToken )
          @me               = @graph.get_object( 'me', :fields => 'email' )
          @user             = User.find_or_create_by :email => @me['email']
          @oauth            = Koala::Facebook::OAuth.new( FB[params['domain']][:app], FB[params['domain']][:secret] )
          @long_lived_token = get_long_token( accessToken )

          begin
            @profile = IshModels::UserProfile.find_by :email => @me['email']
            @profile.update_attributes({ :fb_access_token      => @long_lived_token,
                                         :fb_long_access_token => @long_lived_token })
          rescue Mongoid::Errors::DocumentNotFound
            @profile = IshModels::UserProfile.create :user => @user, :email => @me['email'],
                                      :fb_access_token       => @long_lived_token,
                                      :fb_long_access_token  => @long_lived_token,
                                      :fb_id                 => params[:id],
                                      :name                  => params[:name],
                                      :signed_request        => params[:signedRequest]
          end
          @current_user    = @user
          @current_profile = @profile
        rescue Koala::Facebook::AuthenticationError => e
          render :json => { :status => :not_ok, :errors => "Probably expired token: #{accessToken}" }
          return
        end
      end
    end
    
    def get_long_token accessToken
      url = "https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&" +
            "client_id=#{FB[params['domain']][:app]}&client_secret=#{FB[params['domain']][:secret]}&fb_exchange_token=#{accessToken}"
      result = HTTParty.get url
      token  = JSON.parse result.body
      puts! token['access_token'], "long access token is"
      return token['access_token']
    end

    def set_current_ability
      @current_ability ||= ::Ishapi::Ability.new( current_user )
    end

    def puts! a, b=''
      puts "+++ +++ #{b}"
      puts a.inspect
    end

  end
end
