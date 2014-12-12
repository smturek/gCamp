class TrackerProjectsController < ApplicationController

  def show
    tracker_api = TrackerAPI.new
    @tracker_projects = tracker_api.projects(current_user.tracker_token)
    @tracker_stories = tracker_api.stories(current_user.tracker_token, params[:id])

    @name = ""
    @tracker_projects.each do |project|
      if params[:id] == project[:id].to_s
        @name = project[:name]
      end
    end
  end

end
