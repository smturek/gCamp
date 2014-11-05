require 'rails_helper'

feature "Tasks" do

  scenario "User creates a task" do
    visit tasks_path
    expect(page).to have_no_content("Task 1")
    click_on "New Task"
    fill_in "Description", with: "Task 1"
    click_on "Create Task"
    expect(page).to have_content("Task 1")
  end

  scenario "User edits a task" do
    Task.create(description: 'Task 1')
    visit tasks_path
    click_on "Edit"
    fill_in "Description", with: "Task 2"
    click_on "Update Task"
    expect(page).to have_no_content("Task 1")
    expect(page).to have_content("Task 2")
  end

  scenario "User destroys a task" do
    Task.create(description: 'Task 1')
    visit tasks_path
    expect(page).to have_content("Task 1")
    click_on "Destroy"
    expect(page).to have_no_content("Task 1")
  end
end
