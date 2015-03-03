class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    if user.persisted?
      can :manage, Event
      can :manage User, id: user.id
    else
      can :read, Events
    end
  end
end
