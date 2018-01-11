require_dependency "ishapi/application_controller"

module Ishapi
  class UsersController < ApplicationController
    before_action :set_profile, :only => [ :fb_sign_in, :show ]

    def fb_sign_in
      authorize! :fb_sign_in, Ishapi
      # render :json => { :status => :ok }
      render :action => 'show'
    end

    def show
      authorize! :fb_sign_in, Ishapi
=begin
      begin
        @graph        = Koala::Facebook::API.new( params[:accessToken] )
        me            = @graph.get_object( 'me', :fields => 'email' )
        @user         = User.find_by                   :email => me['email']
        @user_profile = IshModels::UserProfile.find_by :email => me['email']
      rescue Koala::Facebook::AuthenticationError => e
        render :json => { :status => :not_ok, :errors => "Probably expired token." }
        return
      end
=end
    end

=begin
    def update
      authorize! :fb_sign_in, Ishapi
      begin
        @graph        = Koala::Facebook::API.new( params[:accessToken] )
        me            = @graph.get_object( 'me', :fields => 'email' )
        @user         = User.find_by( :email => me['email'] )
        @user_profile = IshModels::UserProfile.find_by :email => me['email']
        flag          = @user_profile.update_attributes( params[:user_profile].permit( :about, :current_city_id ) )
        @errors       = @user_profile.errors.messages
      rescue Koala::Facebook::AuthenticationError => e
        flag = false
        @errors = "Probably expired token."
      end
      if flag
        render :json => { :status => :ok }
      else
        render :json => { :status => :not_ok, :errors => @errors }
      end
    end
=end

  end
end
