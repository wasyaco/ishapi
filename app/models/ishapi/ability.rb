
class Ishapi::Ability
  include ::CanCan::Ability

  def initialize user

    #
    # signed in user
    #
    unless user.blank?

      if user.profile && user.profile.manager?
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
    
    can [ :show ], Gallery do |gallery|
      gallery.is_public
    end

    can [ :show ], Report do |report|
      report.is_public
    end
    
    can [ :welcome_home ], Ishapi

    can [ :index, :show ], Site

    can [ :index ], Venue
    can [ :show ], Venue do |venue|
      venue.is_public
    end
  end
end
