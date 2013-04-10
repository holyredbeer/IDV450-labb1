class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :project
      t.references :ticket_status
      t.references :user

      t.string "title", :limit => 50, :null => false
      t.string "description", :limit => 500
      t.date "start_date", :null => false
      t.date "end_date", :null => false
      t.timestamps
    end
  end
end
