module Ishapi
  class ApplicationController < ActionController::Base
    protect_from_forgery :prepend => true, :with => :exception
    layout :false
    before_action :set_current_ability
    check_authorization
    skip_before_action :verify_authenticity_token

    private

    def set_current_ability
      @current_ability ||= ::Ishapi::Ability.new( current_user )
    end

    def puts! a, b=''
      puts "+++ +++ #{b}"
      puts a.inspect
    end

  end
end
