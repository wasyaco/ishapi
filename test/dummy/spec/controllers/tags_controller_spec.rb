require 'spec_helper'
describe Ishapi::TagsController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
    @report.update_attributes :tag => @tag, :photo => Photo.new( :photo => File.open( Rails.root.join 'data', 'image.jpg' ) )
  end

  context '#show' do
    it 'all reports have photo' do
      get :show, :format => :json, :tagname => @tag.tagname
      result = JSON.parse response.body
      result['reports'][0]['photo']['large_url'].should_not eql nil
    end
  end
  
end
