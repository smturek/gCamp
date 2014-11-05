require "rails_helper"

feature "SignUp" do

  scenario "User signs up" do
    visit users_path
    expect(page).to have_no_content("User 1")
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "User 1"
    fill_in "Last name", with: "User 1"
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "test"
    fill_in "Password confirmation", with: "test"
    click_on "Create New User"
    expect(page).to have_content("User 1 User 1")
    visit users_path
    expect(page).to have_content("User 1")
  end

end
