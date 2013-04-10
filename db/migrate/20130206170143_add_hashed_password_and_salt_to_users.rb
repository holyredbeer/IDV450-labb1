class AddHashedPasswordAndSaltToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
	  t.remove :password
	  t.string :salt
	  t.string :hashed_password
	end
  end
end
