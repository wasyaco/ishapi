
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
    user ||= User.new

    can [ :index, :show ], City
    
    can [ :read ], Gallery do |gallery|
      gallery.is_public
    end

    can [ :read ], Report do |report|
      report.is_public
    end
    
    can [ :welcome_home ], Ishapi

    can [ :index, :show ], Site

  end
end
