module Common
  module Factory
    require File.expand_path('../../parents/tags_name_base', __FILE__)
    
    class TagName < Common::Parent::TagsNameBase
       #layer(@how, @article_id)
        
    end
    
    class TagsName 
    	include Common::Container::ResultsTagArticle
    	register_result_class(TagName)
     	container_tag { layer }
        attr_accessor :article_id
     	def layer 
     		tags_article = Article.find_by_id(@article_id).rel_tag_articles     		
     	end

     	def results
     		tags_results
     	end
        
    end 
  end
end  
