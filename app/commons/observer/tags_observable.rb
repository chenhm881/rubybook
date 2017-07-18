module Common
  module Observer
     class TagObservable
     	attr_reader :tag_name
     	attr_reader :article_id
     	attr_accessor :tag_id
     	attr_accessor :tag_article_id

     	def initialize (tag, tag_article)
            @observers = []
            @observers  << tag
            @observers << tag_article
     	end

        def add_change (tag_name, article_id)
           @tag_name = tag_name
           @article_id = article_id           
        end        
        
     	def notify_observers
     		@observers.each do |observer|
     		    if observer.state? (self)
     		       observer.update()
                end
     		end
     	end
     end   
  end
end
