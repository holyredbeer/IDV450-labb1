class ProjectsController < ApplicationController

	def index
	  @projects = Project.all
	end

	def new
	  @project = Project.new
	end

	def create
	  @project = Project.new(params[:project].merge(:user_id => current_user.id))

	  if @project.save
	  	redirect_to projects_path
	  else
	  	render :action => "new"
	  end
	end
end
