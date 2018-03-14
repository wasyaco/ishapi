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

  describe '#show, cart' do
    before :each do
      @fake_user.profile.current_order.items << FactoryBot.create( :order_item ) # CoTailors::OrderItem.create
      # byebug
      @fake_user.save.should eql true
    end
    
    it 'order items' do
      get :show, :format => :json
      result = JSON.parse response.body
      result['order'].should_not eql nil
    end

    it 'order total' do
      get :show, :format => :json
      response.should render_template 'orders/_show'
      result = JSON.parse response.body
      result['order_total'].should_not eql nil
    end
  end

end
