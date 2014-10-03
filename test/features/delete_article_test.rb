  require "test_helper"

feature "deleting an article" do
  scenario "editor can delete articles" do
    sign_in(:editor)
    visit article_path(articles(:bestarticle))
    click_on "Delete"
    page.text.must_include "Welcome To Teh Blahg"
  end

  scenario "author can't delete articles in show" do
    sign_in(:author)
    visit article_path(articles(:bestarticle))
    page.text.must_include articles(:bestarticle).title
    page.text.wont_include "Delete"
  end

  scenario "author can't delete articles in index" do
    sign_in(:author)
    visit articles_path
    page.text.must_include articles(:worstarticle).title
    page.text.wont_include "Delete"
  end

  scenario "unauthenticated visitor doesn't see delete button in index" do
    visit articles_path
    page.text.wont_include "Delete"
    page.text.must_include articles(:bestarticle).title
  end

  scenario "unauthenticated doesn't see delete button in show" do
    visit article_path(articles(:bestarticle))
    page.text.must_include articles(:bestarticle).title
    page.text.wont_include "Delete"
  end
end

