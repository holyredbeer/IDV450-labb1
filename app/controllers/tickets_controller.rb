class TicketsController < ApplicationController

def index
  @tickets = Ticket.all
end

def show
  @ticket = Ticket.find(params[:id])
end

def new
  @ticket = Ticket.find(params[:id])
end

def show_users_tickets
  if params[:id]
  	@ticket = Ticket.find(params[:id])
  else
    @tickets = Ticket.where(:user_id => current_user.id)
  end
end

end
