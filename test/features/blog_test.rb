require "test_helper"

feature "site has a blog" do
  scenario "user visits the blog" do
    visit(articles_path)
    page.text.must_include "Welcome To Teh Blahg"
  end

  scenario "I can make posts" do
    sign_in
    visit(articles_path)
    click_on "New"
    fill_in("Title", :with=> articles(:bestarticle).title)
    fill_in("Body", :with=> articles(:bestarticle).body)
    click_on "Create Article"
    page.text.must_include("Article was successfully created.")
    page.text.must_include(articles(:bestarticle).title)
    page.has_css? '#author'
    page.text.must_include users(:user).email
  end

  scenario "I can edit posts" do
    sign_in
    visit article_path(articles(:bestarticle))
    click_on "Edit"
    fill_in("Title", :with=> articles(:bestarticle).title)
    fill_in("Body", :with=> articles(:bestarticle).body)
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
  end

  scenario "I can delete posts" do
    sign_in
    visit article_path(articles(:bestarticle))
    click_on "Delete"
    page.text.must_include "Welcome To Teh Blahg"
  end
end
