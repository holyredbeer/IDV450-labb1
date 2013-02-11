class RemoveOneProjectsUsersTable < ActiveRecord::Migration
  def up
  	drop_table :projects_users
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
