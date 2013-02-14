class Ticket < ActiveRecord::Base
  belongs_to :ticket_types
  belongs_to :project
  belongs_to :projects

  attr_accessible :project_id, :ticket_status_id, :user_id, :title, :description, :start_date, :end_date
  
  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :ticket_status_id, :presence => { :message => "You must give the ticket a title" }
  validates :description, length: { minimum: 10, maximum: 450 }, :presence => { :message => "You must give the ticket a description (minimum 10 characters)" }
  validates :start_date, :presence => { :message => "You must choose a start date" }
  validates :end_date, :presence => { :message => "You must choose an end date" }

end
