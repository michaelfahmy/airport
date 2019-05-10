class ActiveAdmin::PagePolicy < ApplicationPolicy
  def show?
    raise Pundit::NotAuthorizedError unless user.manager?

    true
  end
end
