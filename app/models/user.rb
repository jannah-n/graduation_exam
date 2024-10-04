class User < ApplicationRecord
  self.table_name = "users_v3s"
  has_secure_password
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
