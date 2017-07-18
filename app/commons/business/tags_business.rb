module Common
   module Business     
   	 require File.expand_path('../../observer/tags_observer', __FILE__) 
     require File.expand_path('../../observer/tag_article_observer', __FILE__)
     require File.expand_path('../../observer/tags_observable', __FILE__)
     require File.expand_path('../../container/articles_container', __FILE__)
     require File.expand_path('../../factories/tags_name_class', __FILE__)
     class TagBiz

        
     	def motive tags, article_id
		     tags.each_with_index do |tag, ind|
		         observable  = Common::Observer::TagObservable.new(Common::Observer::TagObserver.new, Common::Observer::TagArticleObserver.new)
		         observable.add_change(tag, article_id)
		         observable.notify_observers()  
		     end 
        end

        def remove tags, article_id
            tagsName = Common::Factory::TagsName.new
            tagsName.article_id = article_id
            results = tagsName.results
            results.each do |art_tag|  
                tag = tags.find{ |tag| tag == art_tag.name}
                if tag.nil?
                    TagArticle.from_tags_article_exists?(art_tag.id, article_id)[0].destroy()
                end
            end
        end
     end
   end
end