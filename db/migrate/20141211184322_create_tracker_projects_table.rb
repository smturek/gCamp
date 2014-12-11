class CreateTrackerProjectsTable < ActiveRecord::Migration
  def change
    create_table :tracker_projects do |t|
      t.text :project
    end
  end
end
