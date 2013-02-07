class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  attr_accessible :project_id, :ticket_status_id, :user_id, :title, :description, :start_date, :end_date
  
end
