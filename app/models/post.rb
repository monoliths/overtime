class Post < ApplicationRecord
  validates :date, presence: true
  validates :rationale, presence: true
  validates :overtime_request, presence: true, numericality: { greater_than: 0.0 }
  belongs_to :user
  # allows usage of symbols which represent numerical states on the DB
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  # DB scope that returns all post given a user
  scope :posts_by, -> (user) { where(user_id: user.id) }
end
