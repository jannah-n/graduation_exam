class ChangeEncryptedPasswordToPasswordDigest < ActiveRecord::Migration[7.2]
  def change
    rename_column :users_v3s, :encrypted_password, :password_digest
  end
end
