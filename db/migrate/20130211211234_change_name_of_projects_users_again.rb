class ChangeNameOfProjectsUsersAgain < ActiveRecord::Migration
    def self.up
    	rename_table :projects_user, :projects_users
    end
    def self.down
        rename_table :projects_users, :projects_user
    end
end