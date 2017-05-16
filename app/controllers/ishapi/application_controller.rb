module Ishapi
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout :false

    def puts! a, b=''
      puts "+++ +++ #{b}"
      puts a.inspect
    end

  end
end
