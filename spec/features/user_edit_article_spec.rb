require "rails_helper"

feature "Article Editing" do
  
  before(:all) do
    sign_up
  end

  scenario "allows user to edit article" do

    # создаём новую статью
    visit new_article_path
    
    fill_in :article_title, :with => 'Test Article'
    fill_in :article_text, :with => 'Test article content'

    click_button I18n.t('articles.create')

    # редактируем эту статью (она последняя созданная)
    visit edit_article_path(Article.last)

    # изменяем заголовок
    fill_in :article_title, :with => 'New Title'
    click_button I18n.t('articles.submit')

    # проверяем соответствие измененного заголовка
    expect(page).to have_content 'New Title'

    visit edit_article_path(Article.last)    

    # изменяем содержимое
    fill_in :article_text, :with => 'Edited article content'
    click_button I18n.t('articles.submit')

    # проверяем соответствие измененного содержимого статьи
    expect(page).to have_content 'Edited article content'
  end
end