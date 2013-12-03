class SessionsController < ApplicationController
	def new
	end

	def create
		if @user = login(params[:username],params[:password])
			redirect_to projects_path
		else
			render :new
		end
	end

	def destroy
		logout
		redirect_to root_url
	end
end
