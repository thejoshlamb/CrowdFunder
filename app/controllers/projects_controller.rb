class ProjectsController < ApplicationController

  def index
    @projects = Project.order('projects.created_at DESC')

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new(:project_id => @project.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(proejct_params)
    
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to projects_url
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  private
  def project_params
    params.require(:project).permit(:name,:description,:deadline,:goal)
  end

end
