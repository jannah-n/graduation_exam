class CreateUsersV2 < ActiveRecord::Migration[7.2]
  def change
    create_table :users_v2s do |t|
      t.string :name
      t.string :email
      t.string :password
      
      t.timestamps
    end
  end
end
