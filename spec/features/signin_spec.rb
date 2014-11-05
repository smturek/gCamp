require "rails_helper"

feature "SignIn" do

  scenario "User Signs In" do
    User.create(first_name: "Test",
                last_name: "User 1",
                email: "me@example.com",
                password: "test",
                password_confirmation: "test")
    visit root_path
    expect(page).to have_no_content("Test User 1")
    click_on "Sign In"
    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "test"
    click_on "Sign in"
    expect(page).to have_content("Test User 1")
  end

end
