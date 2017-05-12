
require 'spec_helper'

describe 'route api/reports' do

  it 'index' do
    expect( :get => 'api/reports.json' ).to route_to( 'api/reports#index', :format => 'json' )
  end

  it 'show' do
    expect( :get => 'api/reports/view/some_report.json' ).to route_to( 'api/reports#show', :format => 'json', :name_seo => 'some_report' )
  end  

end
