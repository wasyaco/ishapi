require 'spec_helper'

describe Ishapi::MeasurementsController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(@fake_user)
  end

  it '#update - saves the measurement, heh' do
    @fake_user.profile.measurement.neck_around.should_not eql 5.55
    post :update, :params => { :measurement => { :neck_around => 5.55, :shoulder_width => 2.22 } }, :format => :json
    @fake_user.reload
    @fake_user.profile.measurement.neck_around.should eql 5.55
  end

end
