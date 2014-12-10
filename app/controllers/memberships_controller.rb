class MembershipsController < ApplicationController
  before_action :logged_in?
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :only => [:edit, :update, :destroy] do
    set_membership
    if current_user.admin || owner?(@project, current_user)
    else
      raise AccessDenied
    end
  end

  def index
    @memberships = @project.memberships.all
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
      redirect_to project_memberships_path,
        :notice => "#{@membership.user.full_name} was added successfully"
    else
      render :index
    end
  end

  def update
    set_membership
    @membership.update(membership_params)
    redirect_to project_memberships_path,
      :notice => "#{@membership.user.full_name} was updated successfully"
  end

  def destroy
    set_membership
    if @project.memberships.count != 1 || has_owner?(@project)
      @membership.destroy
      redirect_to project_memberships_path,
        :notice => "#{@membership.user.full_name} was deleted successfully"
    else
      render "index"
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :role_id)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end

end
