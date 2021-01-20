class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :fullname, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX, message: 'Must be an email' }

  has_secure_password
end
