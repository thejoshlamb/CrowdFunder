class CommentsController < ApplicationController

	#before_filter :require_login
	# before_filter :load_project

	def index
	  @comments = Comment.all
	end

	def show
	  @comment = Comment.find(params[:id])
	end

	def new
	  @comment = Comment.new
	end

	def create
		@project = Project.find(params[:project_id])
	  @comment = @project.comments.build(comment_params)
	  @comment.user_id = current_user.id
		
	  respond_to do |format|
	  	if @comment.save
	  		format.html {redirect_to project_path(@project.id), notice: "Comment saved."}
	  		format.js {}
	  	else
	  		format.html {render :action => :show, alert: "Error"}
	  		format.js {}
	  	end
	  end
	end

	def destroy
	  @comment = comment.find(params[:id])
	  @comment.destroy
	  redirect_to comments_url
	end

	private
	def comment_params
	  params.require(:comment).permit(:content, :user_id)
	end

end
