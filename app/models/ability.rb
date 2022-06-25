# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :destroy, [Post, Comment]

    if user.is? :admin
      can :destroy, [Post, Comment]
    else
      can :read, [Post, Comment]
    end
  end
end
