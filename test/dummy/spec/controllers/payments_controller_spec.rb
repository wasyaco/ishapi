require 'spec_helper'
describe Ishapi::PaymentsController do
  render_views
  routes { Ishapi::Engine.routes }
  before :each do
    do_setup
    allow(controller).to receive(:current_user).and_return( User.new({ profile: ::IshModels::UserProfile.new }) )
    allow(controller).to receive(:decode).and_return({ 'user_id' => @user.id })

    @user.reload
    @user.profile.update_attributes n_unlocks: 5
  end

  describe '#unlock' do
    before do
      ::Gameui::PremiumPurchase.destroy_all
    end

    # herehere
    it 'happy path, and duplicates are not unlocked' do
      puts! @report, 'report'

      n = ::Gameui::PremiumPurchase.all.count
      n.should eql 0

      @user.profile.premium_purchases.where( purchased_class: 'Report', purchased_id: @report.id ).count.should eql 0
      @user.profile.n_unlocks.should eql 5

      post :unlock, params: { kind: 'Report', id: @report.id }, format: :json
      response.should be_success
      ::Gameui::PremiumPurchase.all.count.should eql 1
      @user.reload
      @user.profile.n_unlocks.should eql 4
      ::Gameui::PremiumPurchase.where( user_profile_id: @user.profile.id,
        purchased_class: 'Report', purchased_id: @report.id ).count.should eql 1

      # duplicates are not unlocked
      post :unlock, params: { kind: 'Report', id: @report.id }, format: :json
      ::Gameui::PremiumPurchase.where( user_profile_id: @user.profile.id,
        purchased_class: 'Report', purchased_id: @report.id ).count.should eql 1
    end
  end

end
