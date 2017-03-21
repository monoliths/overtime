class PostPolicy < ApplicationPolicy
  def update?
    return true if record.approved? && User.admin?(user)
    return true if record.user_id == user.id && !record.approved?
    return true if User.admin?(user)
  end
end
