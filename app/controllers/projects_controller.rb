class ProjectsController < ApplicationController
  before_action :logged_in?

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_perams)
    @membership = @project.memberships.new(
        :project_id => @project.id,
        :user_id => current_user.id,
        :role_id => Role.find_by_role("owner").id)
    @membership.save
    if @project.save
      redirect_to project_tasks_path(@project), notice: "Project was created successfully"
    else
      render :new
    end
  end

  def edit
    set_project
  end

  def show
    set_project
  end

  def update
    set_project
    if @project.update(project_perams)
      redirect_to projects_path, notice: "Project was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    set_project
    @project.destroy
    redirect_to projects_path, notice: "Project was deleted successfully"
  end

  private ################################

  def project_perams
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
