require_dependency "ishapi/application_controller"

module Ishapi
  class OrdersController < ApplicationController
    before_action :check_profile, :only => [ :create ]

    def create
      authorize! :create, CoTailors::Order

      # byebug

      @order = CoTailors::Order.where( :profile_id => @current_profile.id, :submitted_at => nil ).first
      @order.submitted_at = Time.now
      flag = @order.save
      if flag
        render :json => { :status => :ok, :message => 'Successfully placed the order' }
      else
        render :json => { :status => :not_ok, :error => @order.errors.messages }
      end
    end

  end
end
