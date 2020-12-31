require 'spec_helper'
describe Ishapi::My::GalleriesController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:decode).and_return({ 'user_id' => @user.id })
  end

  it '#index' do
    g = FactoryBot.create(:gallery, user_profile: @user.profile)

    get :index, format: :json
    response.should be_success
    response.should render_template('ishapi/galleries/index')

    json = JSON.parse response.body
    assert json.length > 0
  end

end
