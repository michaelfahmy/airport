class ReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.manager?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
