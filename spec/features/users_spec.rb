require 'rails_helper'

feature "Users" do

  scenario "User creates a user" do
    visit users_path
    expect(page).to have_no_content("User 1")
    click_on "Create New User"
    fill_in "First Name", with: "User 1"
    fill_in "Last Name", with: "User 1"
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "test"
    fill_in "Password confirmation", with: "test"
    click_on "Create User"
    expect(page).to have_content("User 1")
  end

  scenario "User edits a user" do
    User.create(first_name: "User 1",
                last_name: "User 1",
                email: "me@example.com",
                password: "test",
                password_confirmation: "test")
    visit users_path
    expect(page).to have_content("User 1")
    click_on "User 1 User 1"
    click_on "Edit"
    fill_in "First Name", with: "Test"
    click_on "Update User"
    expect(page).to have_no_content("User 1 User 1")
    expect(page).to have_content("Test User 1")
  end

  scenario "User deletes a user" do
    User.create(first_name: "User 1",
                last_name: "User 1",
                email: "me@example.com",
                password: "test",
                password_confirmation: "test")
    visit users_path
    expect(page).to have_content("User 1")
    click_on "User 1 User 1"
    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_no_content("User 1 User 1")
  end

end
