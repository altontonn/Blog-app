class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #   return unless user.present?
    #   can :read, :all
    can :read, Post
    can :read, Comment
    #   return unless user.admin?
    #   can :manage, :all
    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
