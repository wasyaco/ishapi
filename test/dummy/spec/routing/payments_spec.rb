require 'spec_helper'

describe "routes for payments" do
  routes { Ishapi::Engine.routes }

  it "#unlock" do
    expect( :post => '/payments/unlock' ).to route_to( 'ishapi/payments#unlock' )
  end

end

