class User < ApplicationRecord
  has_secure_password

  validates :nick, presence: true, length: {maximum: 24}
  validates :email, presence: true, length: {maximum: 50}, uniqueness: true
  validates :password_digest, presence: true

  has_many :books
end
