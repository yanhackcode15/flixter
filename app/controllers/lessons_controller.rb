class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :only_authorized_for_current_lesson
	def show
	end

	private

	def only_authorized_for_current_lesson
		#check to make sure the user is enrolled in the course
		if !current_user.enrolled_in?(current_lesson.section.course) 
			redirect_to course_path(current_lesson.section.course), :alert => "Please enroll in the course to view the lesson details!"
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||=Lesson.find(params[:id])
	end
end
