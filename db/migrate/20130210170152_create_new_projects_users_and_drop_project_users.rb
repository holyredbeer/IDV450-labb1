class CreateNewProjectsUsersAndDropProjectUsers < ActiveRecord::Migration
  def up
  	create_table :projects_users do |t|
  	  t.integer "project_id"
  	  t.integer "user_id"
    end

    add_index :projects_users, ["project_id", "user_id"]
  	
  	drop_table :project_users
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
