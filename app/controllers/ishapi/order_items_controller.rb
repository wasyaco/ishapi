require_dependency "ishapi/application_controller"

module Ishapi
  class OrderItemsController < ApplicationController
    before_action :check_profile, :only => [ :create ]

    def create
      authorize! :add, CoTailors::OrderItem
      @order_item = CoTailors::OrderItem.new params['order_item'].permit( :quantity, :kind, :fabric )
      @order_item.order_id = @current_order.id
      @order_item.measurement = @measurement
      @order_item.cost = case params[:order_item][:kind]
                         when CoTailors::OrderItem::KIND_SHIRT
                           CoTailors::Product.where( :kind => 'shirt' ).first.cost
                         when CoTailors::OrderItem::KIND_PANTS
                           CoTailors::Product.where( :kind => 'pants' ).first.cost
                         when CoTailors::OrderItem::KIND_SUIT
                           CoTailors::Product.where( :kind => 'suit' ).first.cost
                         end
      @order_item.measurement = CoTailors::ProfileMeasurement.create params['order_item'].permit( CoTailors::Order::MEASUREMENT_PARAMS )

      # byebug

      if params[:order_item][:saveMeasurement]
        m = @current_profile.measurement # || CoTailors::ProfileMeasurement.create( :profile => @current_profile )
        flag = m.update_attributes( measurement_params )
        if !flag
          render :json => { :statuc => :not_ok, :error => m.errors.messages }
          return 
        end
      end
      
      flag = @order_item.save
      if flag
        render :json => { :status => :ok, :message => 'Successfully put an order item' }
      else
        render :json => { :status => :not_ok, :error => @order_item.errors.messages }
      end
    end

    #
    # private
    #
    private

    def measurement_params
      out = {}
      out[:neck_around] = params[:order_item][:neckAround] if params[:order_item][:neckAround]
      out
    end

  end
end
