require_dependency "ishapi/application_controller"

module Ishapi
  class OrderItemsController < ApplicationController
    before_action :check_profile, :only => [ :create ]

    def create
      # byebug

      authorize! :add, CoTailors::OrderItem
      @order_item = CoTailors::OrderItem.new params['order_item'].permit!
      @order_item.order_id = @current_order.id
      flag = @order_item.save
      if flag
        render :json => { :status => :ok, :message => 'Successfully put an order item' }
      else
        render :json => { :status => :not_ok, :error => @order_item.errors.messages }
      end
    end

  end
end
