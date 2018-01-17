require 'spec_helper'

describe Ishapi::OrderItemsController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(@fake_user)
  end

  it '#create - saves measurement' do
    post :create, :params => { :order_item => { :fabric => 'white', :quantity => 2, :neck_around => 2.34 } }, :format => :json
    response.should be_success
    @fake_user.profile.current_order.items.length.should eql 1
    item = @fake_user.profile.current_order.items.first
    item.measurement.neck_around.should eql 2.34
  end

end
