class ProjectsController < ApplicationController

	before_filter :confirm_logged_in, :except => [:login, :attempt_login]

	def confirm_logged_in
		#
	end

	def index
	  @projects = Project.all

	  if signed_in?
	    @users_projects = Project.where(:user_id => current_user.id)
	  end

	end

	def new
	  @project = Project.new
	  @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
	end

	def create
	  @members = params[:project].delete(:members)
	  @project = Project.new(params[:project].merge(:user_id => current_user.id))

	  if @project.save
		@project_members = Projects_users.new
		
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

	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(params[:project])
			redirect_to users_projects_path
			flash.now[:success] = 'Projektet redigerades.' # Not quite right!
		else
			render :action => "edit"
		end
	end

	def manage
	  @users_projects = Project.where(:user_id => current_user.id)
	end

	def show
		@project = Project.find(params[:id])
		# @projects_users = Projects_users.find(:project_id => @project.id)
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
