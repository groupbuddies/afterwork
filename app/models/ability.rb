class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :manage, User, id: user.id
      can :manage, Event, owner: user.id
      can :create, Attendee
      can :update, Attendee, user_id: user.id
      can :manage, Availability, user_id: user.id
    else
      can :read, Event
    end
  end
end
