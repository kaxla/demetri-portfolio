require 'test_helper'

feature "comments" do
  scenario "signed-in user can create comment" do
    sign_in(:user)
    visit article_path(articles(:bestarticle))
    fill_in "Content", with: comments(:firstcomment).content
    click_on "Create"
    page.text.must_include "comment submitted for review"
    page.text.must_include articles(:bestarticle).title
  end

  scenario "unsigned in user can't see add a comment link" do
    visit article_path(articles(:bestarticle))
    page.text.wont_include "Add a Comment"
    page.text.must_include articles(:bestarticle).title
  end

  scenario "signed in user can see add comment link" do
    sign_in(:user)
    visit article_path(articles(:bestarticle))
    page.text.must_include "Content"
    page.text.must_include articles(:bestarticle).title
  end
end
