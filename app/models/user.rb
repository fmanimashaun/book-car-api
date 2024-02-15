class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :reservations

  enum role: { user: 0, admin: 1 }

  after_initialize :set_default_role, if: :new_record?

  # constants for validation
  PASSWORD_INVALID_MESSAGE = 'must include at least one lowercase letter, one uppercase letter, and one digit'.freeze
  USERNAME_INVALID_MESSAGE = 'only allows alphanumeric characters and underscores'.freeze
  USERNAME_REGEX = /\A[a-zA-Z0-9_.]+\z/
  PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}\z/

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, format: { with: USERNAME_REGEX, message: USERNAME_INVALID_MESSAGE }
  validates :password, length: { minimum: 8 }, format: { with: PASSWORD_REGEX, message: PASSWORD_INVALID_MESSAGE }

  roles.keys.each do |role_name|
    define_method("#{role_name}?") do
      role == role_name
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
