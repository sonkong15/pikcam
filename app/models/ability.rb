class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
    can :manage, :all
    else
     can :read, :all
     can :manage, Upload do |upload|
        upload.try(:user) == user
        end
        can :manage, User do |us|
        us.id == user.id 
      end
      can :manage, FunnyVideo do |video|
        video.try(:user) == user
        end
    end

       
         
      
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.can :manage, User do |u|u.id == user.id
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
