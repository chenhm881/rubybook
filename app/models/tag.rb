class Tag < ActiveRecord::Base
 #belongs_to :article, class_name: "TagArticle"
 has_many :tagArticles, foreign_key: 'tag_id', dependent: :destroy
 has_many :articles, through: :tagArticles 
end
