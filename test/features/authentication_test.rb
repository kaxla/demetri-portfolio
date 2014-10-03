require "test_helper"

feature "a user can sign up" do
  scenario "a user wants to sign up" do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.must_have_content "Welcome! You have signed up successfully."
  end

  scenario "an existing user can sign in" do
    sign_in
    page.must_have_content "Signed in successfully"
  end

  scenario "a user wants to sign out" do
    sign_in
    click_on "Sign out"
    page.must_have_content "Signed out successfully"
  end
end
