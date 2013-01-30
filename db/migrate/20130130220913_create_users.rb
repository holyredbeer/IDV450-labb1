class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string "first_name", :limit => 25, :null => false
      t.string "last_name", :limit => 50, :null => false
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40, :null => false
      t.timestamps
    end
  end
end
