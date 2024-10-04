class DropUsersV2 < ActiveRecord::Migration[7.2]
  def up
    drop_table :users_v2s
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
