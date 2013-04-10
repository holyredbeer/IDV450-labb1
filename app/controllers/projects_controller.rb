class ProjectsController < ApplicationController

	before_filter :is_logged_in, :except => [:index]
	before_filter :check_if_owner_or_member, :only => [:show]
	before_filter :check_if_owner, :only => [:edit, :update, :destroy]

	def check_if_owner_or_member
	  @project_id = params[:id]

	  unless is_owner_of_project?(@project_id) || is_member_of_project?(@project_id)
	    redirect_to root_path
	    flash[:error] = "You don't have permission to the project!"
	  end
	end

  	def check_if_owner
  		@project_id = params[:id]

  		unless is_owner_of_project?(@project_id)
  			redirect_to root_path
	      	flash[:error] = "You don't have permission to the project!"
  		end
  	end

	def index

	  if params[:filter] == "admin"

	  	@projects = Project.where(:user_id => current_user.id)


	  elsif params[:filter] == "member"
	  	 @user_is_member = ProjectsUser.where(:user_id => current_user.id)

		 project_ids = []

		 @user_is_member.each do |member|
		   project_ids << member.project_id
		 end

		 @projects = Project.where(:id => project_ids)

	  else
	    @projects = Project.all
	   end

	end

	def new
	  @project = Project.new()
	  @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
	end

	def create
	  @members = params[:project].delete(:members)
	  @users = params[:project].delete(:users)
	  
	  @project = Project.new(params[:project].merge(:user_id => current_user.id))

	  if @project.save
		@project_members = ProjectsUser.new
		
		@members.each do |member|
		  user = User.find(member)
		  @project.users << user
		end

    	redirect_to @project
  	  else
        render :new
  	  end
	end

	def edit
		logger.debug "VAG1: #{@users}"
		@project = Project.find(params[:id])
		@users = User.all
	end

	def update
		logger.debug "VAG2: #{@users}"
		@project = Project.find(params[:id])

		if @project.update_attributes(params[:project])

			redirect_to manage_projects_path
			flash.now[:success] = 'The project was successfully edited.' # Not quite right!
		else
			@users = User.all
			render :action => "edit"
		end
	end

	def manage
	  @users_projects = Project.where(:user_id => current_user.id)
	end

	def show
		@project_id = params[:id]
		@project = Project.find(@project_id)
		@projects_users = @project.users
		@projects_tickets = Ticket.where(:project_id => @project_id)
	end

	def destroy
	  if @project = Project.find(params[:id])
	  	@project.destroy
	  	redirect_to manage_projects_path
	  	flash.now[:success] = 'The project was deleted.' # Not quite right!
	  else
	  	redirect_to users_projects_path
	  	flash.now[:error] = "Something went wrong. The project could't be found."
	  end
	end
end
