class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
end
