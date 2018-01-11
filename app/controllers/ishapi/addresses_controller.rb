require_dependency "ishapi/application_controller"

module Ishapi
  class AddressesController < ApplicationController
    before_action :check_profile, :only => [ :create ]

    def create
      if @current_profile.addresses.length == 0
        @address = CoTailors::Address.new({ :profile_id => @current_profile.id })
      else
        @address = @current_profile.addresses[0]
      end
      authorize! :update, @address
      flag = @address.update_attributes( params[:address].permit(:name, :phone, :address_1, :address_2, :city, :state, :zipcode ) )
      if flag
        render :json => { :status => :ok, :message => 'Successfully put an address.' }
      else
        render :json => { :status => :not_ok, :error => @address.errors.messages }
      end
    end

  end
end
