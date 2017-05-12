require 'spec_helper'
describe 'route api/cities' do

  it 'index' do
    expect( :get => 'api/cities.json' ).to route_to( 'api/cities#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => 'api/cities/view/Chicago.json' ).to route_to( 'api/cities#show', :format => 'json', :cityname => 'Chicago' )
  end  

end
