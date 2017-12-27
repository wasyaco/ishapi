
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
        gallery.user == user
      end
      
    end
    #
    # anonymous user
    #
    user ||= User.new

    can [ :index, :show ], City
    
    can [ :index, :show ], Event

    can [ :index ], Gallery
    can [ :show ], Gallery do |gallery|
      gallery.is_public
    end

    can [ :index ], Report
    can [ :my_index, :show ], Report do |report|
      report.is_public
    end
    
    can [ :welcome_home, :fb_sign_in, :open_permission ], Ishapi

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
