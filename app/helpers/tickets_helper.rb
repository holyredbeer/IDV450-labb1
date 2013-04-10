module TicketsHelper

	def check_if_owner ticket, user
    	Ticket.where("id = ? AND user_id = ?", ticket.id, user.id).count > 0
	end
end
