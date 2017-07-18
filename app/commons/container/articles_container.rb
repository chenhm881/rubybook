module Common
	module Container

      module ResultsTagArticle

      	module ResultsTagArticleMethod
        	
          def register_result_class(result_class)
             @resultClass = result_class
          end

          def resultClass
             @resultClass
          end

          def container_tag(&block)
       		   class_eval %Q( 	 		  
                define_method :container_tag do
                   self.instance_eval(&block)
                end
              )
            end
      	    
      	end
        
      	
        def container_tag 
      	    raise 'Abstract class #{self.class}'
      	end

        def self.included(base)
        	base.extend(ResultsTagArticleMethod)
        end

        protected :container_tag
        def parse_results
            result_class ||= self.class.resultClass
            tags_article = container_tag
            results = []
            tags_article.each do |tag|
              results << result_class.new(tag.id, tag.name)
            end
            results

        end
        
        def tags_results
            parse_results
        end
      end  
   end
end