class ActiveAdmin::PagePolicy < ApplicationPolicy
  def show?
    case record.name
    when 'Dashboard'
      true
    else
      user.manager?
    end
  end
end
