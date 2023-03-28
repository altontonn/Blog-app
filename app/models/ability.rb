class Ability
  include CanCan::Ability

  def initialize(user)
    # allow all users to read all posts and comments
    can :read, Post
    can :read, Comment

    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, author_id: user.id
      # can :create, Post, author_id: user.id
      # can :create, Comment, author_id: user.id
      # can :destroy, Post, author_id: user.id
      # can :destroy, Comment, author_id: user.id
    end
  end
end
