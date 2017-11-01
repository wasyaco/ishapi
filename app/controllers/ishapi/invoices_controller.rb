require_dependency "ishapi/application_controller"
module Ishapi
  class InvoicesController < ApplicationController

    def search
      authorize! :open_permission, ::Ishapi
      begin
        p = IshModels::UserProfile.find_by( :email => params[:email] )
        i = Ish::Invoice.find_by( :number => params[:number] )
        if i.profile == p && i.amount == params[:amount].to_f && i.payments.count == 0
          render :json => { :status => :ok }
        else
          render :status => 404, :json => {} # :json => { :status => 404, :code => 404, :message => 'Not Found1' }
        end
      rescue Mongoid::Errors::DocumentNotFound => e
        puts! e, 'e'
        render :status => 404, :json => {}  #  :json => { :status => 404, :code => 404, :message => 'Not Found1' }
      end
    end

  end
end

