module Ishapi
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout :false
    before_action :set_current_ability
    check_authorization

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
