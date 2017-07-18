module Common
  module Observer
     class TagArticleObserver
     	attr_accessor :tag_id
     	attr_accessor :article_id
     	def update ()
           @tag_article = TagArticle.create('article_id'=> article_id, 'tag_id'=> tag_id)
           @observable.tag_article_id = @tag_article.id
     	end

     	def state? (observable)
     	   @observable = observable
     	   @tag_id =  observable.tag_id
     	   @article_id =  observable.article_id
           @tag_article = TagArticle.from_tags_article_exists?(@tag_id, @article_id)
           @observable.tag_article_id = @tag_article[0].id if !(@tag_article.nil? || @tag_article.empty?)
           @tag_article.nil? || @tag_article.empty?
        end
        
     end
  end
end