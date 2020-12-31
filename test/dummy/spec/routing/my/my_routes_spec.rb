require 'spec_helper'

describe "routes for my/" do
  routes { Ishapi::Engine.routes }

  describe 'galleries' do
    it "#index" do
      expect( :get => '/my/galleries' ).to route_to( 'ishapi/my/galleries#index' )
    end
  end

end

