class CreateTicketStatuses < ActiveRecord::Migration
  def change
    create_table :ticket_statuses do |t|

      t.string "status_name", :limit => 40
      t.timestamps
    end
  end
end
