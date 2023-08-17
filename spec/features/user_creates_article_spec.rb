require "rails_helper"

feature "Article Creation" do
  
  before(:each) do
    sign_up
  end

  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content 'New article'
  end

  scenario "allows user to create new article" do
    
    visit new_article_path

    fill_in :article_title, :with => 'Test Article'
    fill_in :article_text, :with => 'Test article content'

    click_button I18n.t('articles.create')

    expect(page).to have_content 'Test Article'
  end 
end

  