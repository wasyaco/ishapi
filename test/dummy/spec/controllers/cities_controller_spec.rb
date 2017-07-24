require 'spec_helper'

describe Ishapi::CitiesController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => true }))
  end

  it '#index' do
    get :index, :format => :json
    response.should be_success
  end

end
