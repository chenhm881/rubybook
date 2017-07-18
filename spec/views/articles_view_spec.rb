require 'will_paginate/array'
require 'rails_helper'

describe 'articles/show', :type => :view do

  specify "displays the article title" do
    assign(:article, Article.new(:title => "Chicago"))
    render
    expect(rendered).to include("Chicago")
  end
end

RSpec.describe 'articles/index', :type => :view do
  before do
   @articles = [  attributes_for(:article),
                   attributes_for(:article),
                   attributes_for(:article) ]                 
  end

  it "renders _event partial for each event" do
    assign(:articles, [double(Article), double(Article)])
    #assign(:test, [double(Article), double(Article)])
    @simple = ('a'..'e').to_a
    @simple.paginate(:page => 2, :per_page => 3)== %w( d e )
    render
    #expect(view).to render_template(:partial => "_article", :count => 2)
  end
end

RSpec.describe 'articles/1/edit', :type => :view do
  it "displays the article new" do
    assign(:article, create(:article))
    render
    expect(view).to render_template(:partial => "form")
  end
end

