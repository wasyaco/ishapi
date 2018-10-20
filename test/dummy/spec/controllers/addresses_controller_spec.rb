require 'spec_helper'
describe Ishapi::AddressesController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return(UserStub.new({ :manager => false }))
  end

  context '#create' do

    it 'creates new' do
      raise 'not implemented'
    end

    it 'updates existing' do
      raise 'not implemented'
    end

  end

end
