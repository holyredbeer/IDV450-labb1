class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def is_owner_of_project?(project_id)
	Project.exists?(id: project_id, user_id: current_user.id)
  end

  def is_member_of_project?(project_id)
	ProjectsUser.exists?(project_id: project_id, user_id: current_user.id)
  end

  def is_owner_of_ticket?(ticket_id)
	Ticket.exists?(id: ticket_id, user_id: current_user.id)
  end

end
