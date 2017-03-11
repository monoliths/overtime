class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || User.admin?(user)
  end
end
