module Common
  module Observer
     class TagObserver
     	attr_accessor :tag_name
     	def update()
     	   @tag  = Tag.create('name' => tag_name)
     	   @observable.tag_id = @tag.id
     	end
        
        def state? (observable)       	
     	   @observable = observable
     	   @tag_name = observable.tag_name
           @tag = Tag.find_by_name(@tag_name)
           @observable.tag_id = @tag.id if !(@tag.nil?) 
           @tag.nil?        
        end

     end
  end
end