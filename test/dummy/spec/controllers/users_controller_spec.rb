require 'spec_helper'

describe Ishapi::UsersController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
    # allow(controller).to receive(:current_profile).and_return(ProfileStub.new({}))
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
    result['measurements'].should_not eql nil
  end

end
