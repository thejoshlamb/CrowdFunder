class CommentsController < ApplicationController

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
	  @comment = Comment.new(comment_params)
	  
	  if @comment.save
	    redirect_to comments_url
	  else
	    render :new
	  end
	end

	def destroy
	  @comment = comment.find(params[:id])
	  @comment.destroy
	  redirect_to comments_url
	end

	private
	def comment_params
	  params.require(:comment).permit(:amount, :user_id)
	end

end
