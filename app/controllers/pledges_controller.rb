class PledgesController < ApplicationController

	# this before login will be necessary eventually
	# before_filter :require_login

	before_filter :load_project

	def new
		@pledge = Pledge.new
	end

	def show
	  @pledge = Pledge.find(params[:id])
	end

	def create
		#@project = Project.find(params[:project_id])
	  @pledge = @project.pledges.build(pledge_params)
  	@pledge.user_id = current_user.id
  	if @pledge.save
  		redirect_to project_path(params[:project_id])
		end
	end

	private

	def load_project
  	@project = Project.find(params[:project_id])
 	end

	def pledge_params
	  params.require(:pledge).permit(:amount, :user_id)
	end

end
