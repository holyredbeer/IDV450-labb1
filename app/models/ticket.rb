class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  attr_accessible :project_id, :ticket_status_id, :user_id, :title, :description, :start_date, :end_date
  
  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :ticket_status_id, :presence => { :message => "Du maste ange en titel" }
  validates :description, length: { minimum: 5, maximum: 450 }, :presence => { :message => "Du maste ange en beskrivning med minst 10 tecken" }
  validates :start_date, :presence => { :message => "Du maste valja ett startdatum" }
  validates :end_date, :presence => { :message => "Du maste valja ett slutdatum" }

end
