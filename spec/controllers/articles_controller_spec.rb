require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  before do
    @article = create(:article, title: 'POSa', content_markdown: 'content_markdown')
    @articles = [  attributes_for(:article),
                   attributes_for(:article),
                   attributes_for(:article) ]

  end
  it 'assigns the request article to @article' do
    get :show, id: @article
    expect(assigns(:article)).to eq @article
  end

  it 'should redirect to #show' do
    get :show, id: @article
    expect(response).to render_template :show
  end

  it 'assigns the request article be a new Article' do
    post :new
    expect(assigns(:article)).to be_a_new(Article)
  end

  it 'should redirect to #new' do
    post :new
    expect(response).to render_template :new
  end

  context "with valid attributes" do
    it 'assigns the request articles to Article.all' do
      expect{ post :create, article: @articles[0]}.to change(Article, :count).by(1)
    end

    it 'shuld redirect to #index after be created' do
      post :create, id: @article, article: @articles[1]
      expect(response).to redirect_to article_path(assigns[:article])
    end
  end

  context "with invalid attributes" do
    it "does not save the new article in the database" do
          expect{
            post :create,
              article: attributes_for(:article)
          }.to change(Article, :count)
    end

    it "re-renders the :new template" do
      post :create,
            article: attributes_for(:article)
          expect(response).to_not render_template :new
    end
  end

end