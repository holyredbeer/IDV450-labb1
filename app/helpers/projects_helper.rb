module ProjectsHelper

	def check_if_member project, user
    	ProjectsUser.where("project_id = ? AND user_id = ?", project.id, user.id).count > 0
	end
end
