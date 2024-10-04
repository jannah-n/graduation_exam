class CreateUsersV3 < ActiveRecord::Migration[7.2]
  def change
    create_table :users_v3s do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
