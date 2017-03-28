class AuditLog < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  validates :start_date, presence: true
  after_initialize :set_defaults

  # allows usage of symbols which represent numerical states on the DB
  enum status: { submitted: 0, approved: 1, rejected: 2 }


  private
    def set_defaults
      self.start_date ||= (Date.today - 6.days)
    end
end
