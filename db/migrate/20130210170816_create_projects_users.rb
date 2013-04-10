class CreateProjectsUsers < ActiveRecord::Migration
  def up
  	drop_table :projects_users

  	create_table :projects_users do |t|
  	  t.integer "project_id"
  	  t.integer "user_id"
    end

    add_index :projects_users, ["project_id", "user_id"]
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
