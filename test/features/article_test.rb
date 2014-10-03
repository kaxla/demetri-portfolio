require "test_helper"

feature "site has a blog" do

  scenario "article show has all the things it should" do
    visit article_path(articles(:worstarticle))
    page.has_css? '#author'
    page.text.must_include users(:author).email
    page.wont_have_text "Published?"
  end

  scenario "unauthenticated user can only see published" do
    visit articles_path
    page.text.must_include articles(:bestarticle).title
    page.wont_have_text articles(:unpublished).title
  end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    page.wont_have_text("Published")
  end

  scenario "editors can see all articles in index" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include "I'm not published"
  end

  scenario "editors can publish other people's articles" do
    sign_in(:editor)
    visit article_path(articles(:unpublished))
    click_on "Publish"
    page.wont_have_text "Unpublished"
    page.wont_have_button "Publish"
    page.must_have_text articles(:unpublished).title
  end
end
