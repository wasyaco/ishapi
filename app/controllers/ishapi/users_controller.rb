require_dependency "ishapi/application_controller"

module Ishapi
  class UsersController < ApplicationController

    def fb_sign_in
      authorize! :fb_sign_in, Ishapi

      params.permit!

      access_token = params[:accessToken]
      email        = params[:email]
      name         = params[:name]
      user         = User.where( :email => email ).first

      u = IshModels::UserProfile.find_or_create_by :email => email
      u.fb_access_token = access_token
      u.name ||= name
      u.user = user
      u.user ||= User.create( :email => email, :password => (0..8).map { "#{rand(100)}" }.join("#{rand(100)}") )

      if u.save
        render :json => { :status => :ok }
      else
        render :json => { :status => :not_ok, :errors => u.errors.messages }
      end
    end

    def show
      authorize! :fb_sign_in, Ishapi

      @graph        = Koala::Facebook::API.new( params[:accessToken] )
      me            = @graph.get_object( 'me', :fields => 'email' )
      @user         = User.find_by( :email => me['email'] )
      @user_profile = IshModels::UserProfile.find_by :email => me['email']
    end

  end
end
