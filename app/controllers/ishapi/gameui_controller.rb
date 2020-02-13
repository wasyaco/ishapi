require_dependency "ishapi/application_controller"

module Ishapi
  class GameuiController < ApplicationController
    before_action :check_long_term_token, except: []

    def buy_stars
      authorize! :buy_stars, @profile
      puts! @current_user, 'current_user'
      puts! @profile, 'profile'

      payment = Ish::Payment.new :email => @profile.email, :amount => params[:amount],
        profile: @profile

      ::Stripe.api_key = STRIPE_SK
      acct = Stripe::Account.create(
        :country => 'US',
        :type => 'custom'
      )
      charge = ::Stripe::Charge.create(
        :amount => params[:amount],
        :currency => 'usd',
        :source => params[:stripeToken],
        :destination => { 
          :account => acct,
        }
      )
      puts! charge, 'charge'
      payment.charge = JSON.parse( charge.to_json )
      payment.save
      if payment.persisted?
        # add the star
        @profile.n_stars += 1
        @profile.save
        if !@profile.persisted?
          raise 'could not save profile, somehow'
        end
      else
        puts! payment.errors.messages
      end

      render json: { status: 'ok', n_stars: @profile.n_stars }
    end

    ## spend the star
    def do_purchase
      authorize! :do_purchase, ::Gameui
      item = params[:className].constantize.find_by_slug( params[:slug] )
      
      raise 'no such item'     if !item
      raise 'too little funds' if @profile.n_stars < item.premium_tier

      ::IshModels::UserProfile.with_session do
        @profile.update_attributes( n_stars: @profile.n_stars - item.premium_tier )
        @purchase = ::Gameui::PremiumPurchase.create! user_profile: @profile, item: item
      end

      render json: @purchase
    rescue ::Exception => e
      render json: e
    end

  end
end
