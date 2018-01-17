require 'spec_helper'

describe Ishapi::UsersController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(@fake_user) # UserStub.new({ :manager => false }))
  end

  it '#show, has address' do
    get :show, :format => :json
    response.should be_success
    result = JSON.parse response.body
    result['address'].should_not eql nil
  end

  it '#show, has measurements' do
    get :show, :format => :json
    response.should be_success
    result = JSON.parse response.body
    result['measurement'].should_not eql nil
  end

  it '#show, has cart' do
    @fake_user.profile.current_order.items << CoTailors::OrderItem.create
    @fake_user.save
    get :show, :format => :json
    result = JSON.parse response.body
    result['order'].should_not eql nil
  end

end
