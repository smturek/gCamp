class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = @project.memberships.all
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
    @membership.save
    redirect_to project_memberships_path,
        :notice => "#{@membership.user.full_name} was added successfully"
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :role_id)
  end

end
