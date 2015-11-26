class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :show]
	def index

	end
end
