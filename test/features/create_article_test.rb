require "test_helper"

feature "site has a blog" do
  scenario "author can make articles" do
    sign_in(:author)
    visit new_article_path
    fill_in "Title", with: articles(:bestarticle).title
    fill_in "Body", with: articles(:bestarticle).body
    click_on "Create Article"
    page.text.must_include "Article was successfully created."
  end

  scenario "editor can create articles" do
    sign_in(:editor)
    visit new_article_path
    fill_in "Title", with: articles(:bestarticle).title
    fill_in "Body", with: articles(:bestarticle).body
    click_on "Create Article"
    page.text.must_include "Article was successfully created"
  end

  scenario "unauthenticated visitors can't visit new_article path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated visitors can't see new article button" do
    page.wont_have_link "New Article"
  end
end
