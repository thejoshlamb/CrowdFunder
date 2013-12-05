class SessionsController < ApplicationController
	def new
	end

	def create
		if @user = login(params[:username],params[:password])
			redirect_to projects_path, notice: "HOORAY"
		else
			render :new, alert: "Login Failed :("
		end
	end

	def destroy
		logout
		redirect_to root_url, notice: "Logged out"
	end
end
