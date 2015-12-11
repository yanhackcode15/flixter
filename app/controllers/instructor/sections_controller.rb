class Instructor::SectionsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorized_for_current_course

	def new
		# @course = Course.find(params[:course_id])
		@section = Section.new #can I pass (@course) in the new?
	end

	def create
		# @course = Course.find(params[:course_id])
		@section = current_course.sections.create(section_params)
		redirect_to instructor_course_path(current_course)
	end

	private
	def require_authorized_for_current_course
		# if current_course.authorized?(current_user.id)
		# 	render :text => "Unauthorized", :status => :unauthorized
		# end 
		if current_course.user!=current_user
			render :text => "Unauthorized", :status => :unauthorized
			
		end

	end 

	helper_method :current_course
	def current_course
		@current_course ||=Course.find(params[:course_id])
	end

	def section_params
		params.require(:section).permit(:title)
	end
end
