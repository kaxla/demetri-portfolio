require "test_helper"

feature "Articles can be updated" do
  scenario "Editors can update articles" do
    sign_in(:editor)
    visit article_path(articles(:bestarticle))
    click_on "Edit"
    fill_in "Title", with: articles(:worstarticle).title
    fill_in "Body", with: articles(:worstarticle).body
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
  end

  scenario "Authors can update articles" do
    sign_in(:author)
    visit article_path(articles(:worstarticle))
    click_on "Edit"
    fill_in "Title", with: articles(:unpublished).title
    fill_in "Body", with: articles(:unpublished).body
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
  end

  scenario "unauthenticated can't see update button in show" do
    visit article_path(articles(:worstarticle))
    page.text.wont_include "Edit"
    page.text.must_include articles(:worstarticle).title
  end

  scenario "unauthenticated can't see update button in index" do
    visit articles_path
    page.text.wont_include "Edit"
    page.text.must_include articles(:worstarticle).title
  end

  scenario "unauthenticated can't hack update" do
    visit edit_article_path(articles(:bestarticle))
    page.text.must_include "Log in"
    page.text.wont_include articles(:bestarticle).title

  end
end
