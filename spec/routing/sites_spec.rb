require 'spec_helper'
describe 'routes of api sites' do

  it 'newsitems' do
    expect( :get => 'api/sites/local.com.json' ).to route_to( 'api/newsitems#index', :domain => 'local.com', :format => 'json' )
  end

end
