require 'spec_helper'
describe Ishapi::My::MyController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
    allow(controller).to receive(:decode).and_return({ user_id: @user.id })
  end

  it '#account' do
    get :account, format: :json
    response.should be_success
    puts! response.body
  end

end
