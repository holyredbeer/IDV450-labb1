class TicketStatus < ActiveRecord::Base
  has_many :tickets, :dependent => :destroy
  attr_accessible :status_name
  
end
