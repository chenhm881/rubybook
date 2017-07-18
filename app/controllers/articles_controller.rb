class ArticlesController < ApplicationController
  include ArticlesHelper
  def show
    byebug
    @article = Article.find(params[:id])
    #render :text => proc { |response, output| output.write("Hello from code!") }
    #render :js => "$('#time_div').html('This is the outline ajax');"
    #render :json => {:name => "David"}.to_json, :callback => 'show'
    #render :inline => "<%= 'hello ' + name %>", :locals => { :name => "david" }
  end

  def json
    #render :js => "$('#time_div').html('This is the outline ajax');"
    content = markdown params[:content]
    render :json => {:name => "David", :content => content}.to_json, :callback => 'show'
  end

  def search
     search = params[:keywords]
     page = params[:page]
     if page.nil?
      page = 1
     end
     business = Common::Business::ArticleBiz.new("ArticleConfig","Material")
     @articles = business.find_articles(search, page)
     respond_to do |format|
        format.html { render @article }
        format.js {render :action => 'search'}
     end

  end

  def tags
     article_id = params[:article_id]
     tags = params[:tags]
     tag_biz = Common::Business::TagBiz.new
     tag_biz.motive(tags, article_id)
     tag_biz.remove(tags, article_id)

     render :json => {:name => "David"}.to_json, :callback => 'show'
  end

  def answer
    @article = Article.find(2)
    respond_to do |format|
      format.html {render @article}
      format.js { render 'articles/answer'}
      format.json {render :json => {:name => "David"}.to_json}
    end
  end

  def new
    @article = Article.new
    @tags = @article.tags
  end

  def create
    params.permit!
    params[:article][:content] = markdown params[:article][:content]
    @article = Article.create(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end

  end

  def index
    if (params[:category_id])
      @category = Category.find(params[:category_id])
      @articles =  @category.articles
    else
      @articles = Article.all
    end
    @articles = @articles.paginate(:page => params[:page])
  end

  def edit
    @article = Article.find(params[:id])
    @tags = @article.tags.select("name")
    if @article.tags==0
      @weight=0
    else
      @weight = (@article.tags.length / 4==0)? 1 : (@article.tags.length / 4)
    end
  end

  def say_when
     render_text "＜p＞The time is ＜b＞" + DateTime.now.to_s + "＜/b＞＜/p＞"
  end

  def update
    params.permit!
    @article = Article.find(params[:id])
    params[:article][:content] = markdown params[:article][:content]
    debugger
    respond_to do |format|
      if @article.update_attributes(params[:article])
        tags = params[:tags][:name].select{|p| p =~ /\w+/ }
        tag_biz = Common::Business::TagBiz.new
        tag_biz.motive(tags, params[:id])
        tag_biz.remove(tags, params[:id])
        format.html { redirect_to edit_article_path }
        format.js
        format.json { render json: "json", status: :unprocessable_entity }
      else
        format.html { render action: "edit" }
        format.js
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end

    end

  end

  def note
    @notes = Article.all
    @note = Article.first
    @notes = Array.new
    person = {"name"=>"lxee","age"=>25,"sex"=>"男"}
    @notes << person
    @notes << person

  end

  def new_content
    @note = Article.new
    respond_to do |format|
      format.html {render @note}
      format.js {render "articles/new_content"}
    end
  end

  def save_content
    params.permit!
    debugger
    @note = require.params[:note][:sex].permit!
  end

end