class EnrollmentsController < ApplicationController
	before_action :authenticate_user!
	def create
		current_user.enrollments.create(:course => current_course)
		redirect_to course_path(current_course)
	end

	private

	# def require_authorized_for_current_course
	# 	if current_user != current_course.user 
	# 		render :text =>"Unauthorized", :status => :unauthorized
	# 	end
	# end

	# helper_method :current_course
	def current_course
		@current_course ||=Course.find(params[:course_id])
		 
	end

	# def course_params
	# 	params.require(:course).permit(:title, :description, :cost, :image)
	# end

end
