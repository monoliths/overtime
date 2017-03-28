class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if User.admin?(user)
  end
end
