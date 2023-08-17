require "rails_helper"

feature "Comment Creation" do

  before(:all) do
    sign_up
  end

  scenario "allows user to create new article" do

    visit new_article_path

    fill_in :article_title, :with => 'Test Article'
    fill_in :article_text, :with => 'Test article content'

    click_button I18n.t('articles.create')

    fill_in :comment_body, :with => 'This is a test comment'

    click_button I18n.t('articles.create_comment')

    expect(page).to have_content 'This is a test comment'
  end
end