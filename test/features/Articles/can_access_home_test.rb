require "test_helper"

feature "site has a home page" do
  scenario "user visits home page" do
    visit("/")
    page.text.must_include "Welcome"
  end
end
