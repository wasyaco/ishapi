require 'test_helper'

def puts! a, b=''
  puts "+++ +++ #{b}"
  puts a.inspect
end

module Ishapi
  class CitiesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
    end

    def test_cities_index
      result = get '/api/cities.json'
      puts! result
    end
  end
end
