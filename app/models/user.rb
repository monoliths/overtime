class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_PHONE_REGEX = /[0-9]{10}/
  validates :phone, presence: true,
                    format: { with: VALID_PHONE_REGEX },
                    length: { is: 10 }
  has_many :posts

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end

  def self.admin?(user)
    user.class == AdminUser
  end

end
