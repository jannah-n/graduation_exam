class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { minimum: 6 }
  validates :encrypted_password, presence: true, length: { minimum: 6 }
end
