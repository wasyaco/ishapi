
class Ishapi::Ability
  include ::CanCan::Ability

  def initialize user

    #
    # signed in user
    #
    unless user.blank?

      if user.profile && user.profile.sudoer?
        can :manage, :all
      end

      can [ :show ], Gallery do |gallery|
        gallery.user_profile == user.profile
      end

      can [ :update ], ::CoTailors::Address do |address|
        puts [ user.inspect, address.inspect ], '+++ user in cancancan'
        true
      end

      can [ :buy_stars ], ::IshModels::UserProfile

    end
    #
    # anonymous user
    #
    user ||= User.new

    can [ :show ], IshModels::UserProfile

    can [ :index, :show ], City

    can [ :update ], ::CoTailors::Address
    can [ :add ], ::CoTailors::OrderItem
    can [ :create, :update_measurements ], ::CoTailors::Order
    can [ :show ], ::CoTailors::Product

    can [ :index, :show ], Event

    #
    # G
    #
    can [ :index ], Gallery
    can [ :show ], Gallery do |gallery|
      gallery.is_public
    end
    can [ :index, :show ], ::Gameui::Map

    can [ :index ], Report
    can [ :my_index, :show ], Report do |report|
      report.is_public
    end
    
    can [ :fb_sign_in, :long_term_token, :open_permission, :welcome_home ], Ishapi

    can [ :index, :show ], Site

    can [ :index ], Tag
    can [ :show ], Tag do |tag|
      tag.is_public
    end

    can [ :index ], Venue
    can [ :show ], Venue do |venue|
      venue.is_public
    end
    can [ :index ], Video
    can [ :show ], Video do |video|
      video.is_public
    end
  end
end
