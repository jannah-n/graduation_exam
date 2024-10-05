class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.digest(password)
    BCrypt::Password.create(password)
  end
end
