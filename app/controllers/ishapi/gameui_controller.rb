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

  end
end
