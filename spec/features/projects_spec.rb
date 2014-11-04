require 'rails_helper'

feature "Projects" do

  scenario "User creates a project" do
    visit projects_path
    expect(page).to have_no_content("Project X")
    click_on "Create New Project"
    fill_in "Name", with: "Project X"
    click_on "Create Project"
    expect(page).to have_content("Project X")
  end

  scenario "User edits a project" do
    Project.create!(name: "Project 1")
    visit projects_path
    expect(page).to have_content("Project 1")
    click_on "Project 1"
    click_on "Edit"
    fill_in "Name", with: "Project 2"
    click_on "Update Project"
    expect(page).to have_content("Project 2")
    expect(page).to have_no_content("Project 1")
  end

  scenario "User deletes an event" do
    Project.create(name: "Project 1")
    visit projects_path
    click_on "Project 1"
    click_on "Destroy"
    expect(page).to have_no_content("Project 1")
  end
end
