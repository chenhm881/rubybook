require 'will_paginate/array'
require 'rails_helper'
#require 'selenium-webdriver'
require 'database_cleaner'
require 'capybara'
require 'capybara/dsl'


Capybara.default_driver = :webkit


feature 'new page' do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  before do          
  end
  include Capybara::DSL
  scenario "displays the categories new", js: false do
  

    @article = FactoryGirl.create(:category)
    #@article = Article.create(title: 'specail hotel', content: 'GDS:14583', category_id: 1)
    
    visit  "/categories/1/edit" 
    fill_in "category_name", with: "stub"
    fill_in "category_description", with: "scenarios"
    click_on 'Update my Category'
    expect(page).to have_content("stub")
  end

end

