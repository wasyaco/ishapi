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

    # this doesn't generate long-lived token, doesn't update user_profile
    def check_profile
      accessToken   = request.headers[:accessToken]
      accessToken ||= params[:fb_long_access_token]
      accessToken ||= params[:accessToken]
      if accessToken
        @graph            = Koala::Facebook::API.new( accessToken )
        @me               = @graph.get_object( 'me', :fields => 'email' )
        @current_user     = User.find_by :email => @me['email']
      else
        @current_user     = current_user  if Rails.env.test?
      end
      @current_profile  = @current_user.profile
      @current_order    = @current_profile.current_order
      # orders.where( :submitted_at => nil ).first || ::CoTailors::Order.create( :profile_id => @current_profile.id )
    end

    def set_profile
      accessToken   = request.headers[:accessToken]
      accessToken ||= params[:fb_long_access_token]
      accessToken ||= params[:accessToken]

      # params[:domain] ||= '_default'

      if accessToken
        begin
          @graph            = Koala::Facebook::API.new( accessToken )
          @me               = @graph.get_object( 'me', :fields => 'email' )
          @current_user     = User.find_or_create_by :email => @me['email']
          @oauth            = Koala::Facebook::OAuth.new( FB[params['domain']][:app], FB[params['domain']][:secret] )
          get_token         = get_long_token( accessToken )
          @long_lived_token = get_token['access_token']

          begin
            @current_profile = IshModels::UserProfile.find_by :email => @me['email']
            @current_profile.update_attributes({ :fb_access_token      => @long_lived_token,
                                         :fb_long_access_token => @long_lived_token,
                                         :fb_expires_in        => get_token['expires_in']
                                       })
          rescue Mongoid::Errors::DocumentNotFound
            @current_profile = IshModels::UserProfile.create :user => @current_user, :email => @me['email'],
                                                             :fb_access_token       => @long_lived_token,
                                                             :fb_long_access_token  => @long_lived_token,
                                                             :fb_expires_in         => get_token['expires_in'],
                                                             :fb_id                 => params[:id],
                                                             :name                  => params[:name],
                                                             :signed_request        => params[:signedRequest]
          end
          @current_user.reload
        rescue Koala::Facebook::AuthenticationError => e
          render :json => { :status => :not_ok, :errors => "Probably expired token: #{accessToken}" }
          return
        end
      else
        @current_user = current_user if Rails.env.test?
      end
      @current_profile = @current_user.profile
      @current_order   = @current_profile.current_order
      # orders.where( :submitted_at => nil ).first || ::CoTailors::Order.new( :profile_id => @current_profile.id )
    end
    
    def get_long_token accessToken
      url = "https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&" +
            "client_id=#{FB[params['domain']][:app]}&client_secret=#{FB[params['domain']][:secret]}&fb_exchange_token=#{accessToken}"
      result = HTTParty.get url
      token  = JSON.parse result.body
      return token # ['access_token']
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
