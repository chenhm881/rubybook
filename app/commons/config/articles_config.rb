module Common
  module Config
     class ArticleConfig
     	attr_accessor :statuses
     	def initialize
     		@statuses = ["title", "tagName", "content"]
     	end
     end
      
  end
end