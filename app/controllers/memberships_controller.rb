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
    @membership.destroy
    redirect_to project_memberships_path,
      :notice => "#{@membership.user.full_name} was deleted successfully"
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :role_id)
  end

  def set_membership
    @membership = Membership.find(params[:id])
  end

end
