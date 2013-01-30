class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|

      t.timestamps
    end
  end
end
