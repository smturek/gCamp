require 'rails_helper'

feature "Tasks" do

  scenario "User creates a task" do
    project = Project.create!(name: "My Project")
    visit project_path(project)
    click_on "0 Tasks"
    expect(page).to have_no_content("Task 1")
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    click_on "Create Task"
    expect(page).to have_content("Task 1")
  end

  scenario "User edits a task" do
    project = Project.create!(name: "My Project")
    visit project_path(project)
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    click_on "Create Task"
    click_on "Edit"
    fill_in "Description", with: "Task 2"
    click_on "Update Task"
    expect(page).to have_no_content("Task 1")
    expect(page).to have_content("Task 2")
  end

  scenario "User destroys a task" do
    project = Project.create!(name: "My Project")
    visit project_path(project)
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    click_on "Create Task"
    expect(page).to have_content("Task 1")
    click_on "Back"
    click_on "Destroy"
    expect(page).to have_no_content("Task 1")
  end

  scenario "User attempts to create empty task" do
    project = Project.create!(name: "My Project")
    visit project_path(project)
    click_on "0 Tasks"
    click_on "New Task"
    click_on "Create Task"
    expect(page).to have_content("Description can't be blank")
  end

  scenario "User attempts to create a task in the past" do
    project = Project.create!(name: "My Project")
    visit project_path(project)
    click_on "0 Tasks"
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    fill_in "Due date", with: "1/1/1901"
    click_on "Create Task"
    expect(page).to have_content("Due date can't be in the past")

  end

end
