class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.references

      t.string "title", :limit => 50, :null => false
      t.string "description", :limit => 500
      t.date "start_date", :null => false
      t.date "end_date", :null => false
      t.timestamps
    end
  end
end
