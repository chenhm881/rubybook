require 'will_paginate/array'
require 'rails_helper'
require 'selenium-webdriver'
require 'database_cleaner'

feature 'new page' do

  let(:tag) { Tag.create(name: 'scenarios')}

  scenario "displays the article new", js: true do
  	FactoryGirl.create(:category)
    FactoryGirl.create(:article)
    FactoryGirl.create(:tag)
    FactoryGirl.create(:tag_article)
    visit  "/articles/1/edit"
    debugger
    fill_in "article_title", with: "stub"
    fill_in "article_content_markdown", with: "scenarios"
    click_button 'submit'
    expect(page).to have_content(tag.name)

  end

end

