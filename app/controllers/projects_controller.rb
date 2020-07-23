class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(set_params)
    @project.user = current_user
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def set_params
    params.require(:project).permit(:title, :rich_body, :photo)
  end

end

