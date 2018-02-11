require 'spec_helper'

describe Ishapi::CitiesController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
  end

  it '#index' do
    get :index, :format => :json
    response.should be_success
  end

  it '#features' do
    get :features
    results = assigns( :cities )
    results.length.should eql City.where( :is_feature => true ).count
    results.length.should_not eql City.count
    results.map(:is_feature).uniq.should eql([ true ])
  end

  it '#show' do
    get :show, :params => { :cityname => @city.cityname }
    response.should be_success
    response.should render_template 'show'
  end

end
