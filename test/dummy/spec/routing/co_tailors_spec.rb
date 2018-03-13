require 'spec_helper'

describe "routes of CoT" do
  routes { Ishapi::Engine.routes }
  it "update measurements" do
    expect( :post => '/co_tailors/measurements' ).to route_to( :controller => 'ishapi/measurements', :action => 'update' )
  end
end

