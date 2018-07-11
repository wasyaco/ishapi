require_dependency "ishapi/application_controller"
module Ishapi
  class PaymentsController < ApplicationController

    def create
      authorize! :open_permission, ::Ishapi
      begin
        invoice = Ish::Invoice.where( :email => params[:email], :number => params[:number] ).first
        payment = Ish::Payment.new :invoice => invoice, :email => params[:email], :amount => params[:amount]
        amount_cents  = ( params[:amount].to_f * 100 ).to_i

        ::Stripe.api_key = STRIPE_SK
        acct = Stripe::Account.create(
          :country => 'US',
          :type => 'custom'
        )
        charge = ::Stripe::Charge.create(
          :amount => amount_cents,
          :currency => 'usd',
          :source => params[:token][:id],
          :destination => { 
            :account => acct,
          }
        )
        # puts! charge, 'charge'

        payment.charge = JSON.parse( charge.to_json )
        if payment.save
          render :json => { :status => :ok }
        else
          render :status => 404, :json => {}
        end
      rescue Mongoid::Errors::DocumentNotFound => e
        puts! e, 'e'
        render :status => 404, :json => {}
      end
    end

  end
end

