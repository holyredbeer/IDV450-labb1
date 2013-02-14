class TicketsController < ApplicationController

	before_filter :is_logged_in
	before_filter :check_if_owner_or_member, :only => [:show]
	before_filter :check_if_owner, :only => [:edit, :update, :destroy]

	def check_if_owner_or_member
	  @ticket_id = params[:id]
	  @project_id = Ticket.find(@ticket_id).project_id

	  unless is_owner_of_project?(@project_id) || is_member_of_project?(@project_id)
	    redirect_to root_path
		flash[:error] = "You don't have permission to the ticket!"
	  end
	end

	def check_if_owner
	  @ticket_id = params[:id]
	  @project_id = Ticket.find(@ticket_id).project_id

      unless is_owner_of_project?(@project_id) || is_owner_of_ticket?(@ticket_id)
        redirect_to root_path
		flash[:error] = "You don't have permission to the ticket!"
	  end
	end

	def index
	  @tickets = Ticket.all
	end

	def show
	  @ticket = Ticket.find(params[:id])
	  @ticket_status = TicketStatus.find(@ticket.ticket_status_id)
	  @project = Project.find(@ticket.project_id) # find en, where många?
	end

	def manage
	  @tickets = current_user.tickets
	  @tickets_for_owned_projects = current_user.project_tickets
	end

	def new
	  @ticket = Ticket.new(:project_id => params[:project_id])
	end

	def create

	  @ticket = Ticket.new(params[:ticket].merge(:user_id => current_user.id))
	  @id = params[:project_id] # but make sure it is under this key in params

	  if @ticket.save
		redirect_to @ticket
      else
 		 render :new
	  end
	end

	def edit
		@ticket = Ticket.find(params[:id])
	end

	def update
		@ticket = Ticket.find(params[:id])

		if @ticket.update_attributes(params[:ticket])

			redirect_to @ticket
			flash.now[:success] = 'Your ticket was successfully edited.' # Not quite right!
		else
			render :action => "edit"
		end
	end

	def update_status
		@ticket = Ticket.find(params[:ticket_id])

		@ticket.ticket_status_id = params[:ticket_status_id]

		if @ticket.save

			redirect_to @ticket
			flash.now[:success] = 'The ticket was successfully edited.' # Not quite right!
		else
			redirect_to @ticket
		end	
	end

	def show_users_tickets
	  if params[:id]
	  	@ticket = Ticket.find(params[:id])
	  else
	    @tickets = Ticket.where(:user_id => current_user.id)
	  end
	end

	def destroy
	  if @ticket = Ticket.find(params[:id])
	  	@ticket.destroy
	  	redirect_to manage_tickets_path
	  	flash.now[:success] = 'The ticket was deleted.' # Not quite right!
	  else
	  	redirect_to users_tickets_path
	  	flash.now[:error] = "Something went wrong. Could'nt find the ticket."
	  end
	end

end
