require_dependency "ishapi/application_controller"

module Ishapi
  class OrderItemsController < ApplicationController
    before_action :check_profile, :only => [ :create ]

    def create
      authorize! :add, CoTailors::OrderItem
      @measurement = CoTailors::ProfileMeasurement.create params['order_item'].permit( :neck_around )
      @order_item = CoTailors::OrderItem.new params['order_item'].permit( :quantity, :kind, :fabric )
      @order_item.order_id = @current_order.id
      @order_item.measurement = @measurement
      @measurement.order_item_id = @order_item.id
      @measurement.save

      if params[:order_item][:saveMeasurement]
        m = @current_profile.measurements[0] || CoTailors::ProfileMeasurement.create( :profile => @current_profile )
        flag = m.update_attributes( measurement_params )
        render :json => { :statuc => :not_ok, :error => m.errors.messages } and return if !flag
      end
      
      flag = @order_item.save
      if flag
        puts! @order_item.measurement, 'ok'
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
