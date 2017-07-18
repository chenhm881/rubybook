class TagArticle < ActiveRecord::Base
   belongs_to :tag
   belongs_to :article 
  def self.from_tags_article_exists? (tag_id, article_id)
    where("tag_id=:tag_id and article_id=:article_id", tag_id: tag_id, article_id: article_id)
  end
  
  def self.from_tags_by_article(article_id)
    where("article_id=:article_id", article_id: article_id)
  end


end
  
