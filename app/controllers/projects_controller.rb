class ProjectsController < ApplicationController

	before_filter :is_logged_in, :except => [:index, :show]

	def index
	  @projects = Project.all
	  # @user_is_member = ProjectsUser.where(:user_id => current_user.id) d
	end

	def new
	  @project = Project.new
	  @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
	end

	def create
	  @members = params[:project].delete(:members)
	  @project = Project.new(params[:project].merge(:user_id => current_user.id))

	  if @project.save
		@project_members = ProjectsUser.new
		
		@members.each do |member|
		  user = User.find(member)
		  @project.users << user
		end

    	redirect_to @project
  	  else
    	@users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
        render :new
  	  end
	end

	def edit
		@project = Project.find(params[:id])
		@users = User.all
	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(params[:project])

			redirect_to manage_projects_path
			flash.now[:success] = 'Projektet redigerades.' # Not quite right!
		else
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
	  	flash.now[:success] = 'Projektet togs bort' # Not quite right!
	  else
	  	redirect_to users_projects_path
	  	flash.now[:error] = 'Nagot gick snett. Projektet kunde inte hittas.'
	  end
	end
end
