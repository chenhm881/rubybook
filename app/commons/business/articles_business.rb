module Common
  module Business
  	 require File.expand_path('../../config/articles_config', __FILE__) 
     require File.expand_path('../../factories/materials_class', __FILE__)
     class ArticleBiz
	      def initialize (config, material)
	          @config = Object.const_get("Common::Config::#{config}").new
	          @material = eval("Common::Factory::" + material).new
	      end
        class_eval do
            def find_articles(search, page)
	            if search.nil? || search == ""
	                @articles = all(page)
	            else
	                @articles = query(search, page)
	            end

            end

            define_method "all" do |page|
                Article.all.page(page)
            end
            
            define_method "query" do |search, page|
                @config.statuses.each do |statuse|
                   @material.statuses = statuse                     
                end
                @material.collect { |statuse| @material.add_commands { Article.send('from_article_by_' + statuse, search) } }
                @material.handle
                @material.articles.page(page)
            end
      
        end
              
     end

  end
end