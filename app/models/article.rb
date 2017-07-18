require 'will_paginate/array'
class Article < ActiveRecord::Base
   belongs_to :category
   validates :title, presence: true
   has_many :relatartitsels, foreign_key: "correlation_id", dependent: :destroy
   has_many :correlated_arts, through: :relatartitsels, source: :correlated
   has_many :reverse_relatartitsels, foreign_key: "correlated_id",
                                   class_name:  "Relatartitsel",
                                   dependent:   :destroy
   has_many :correlation_arts, through: :reverse_relatartitsels, source: :correlation

   has_many :tag_articles, foreign_key: 'article_id', dependent: :destroy

   has_many :rel_tag_articles, through: :tag_articles, source: :tag
   has_many :tagArticles, foreign_key: 'article_id', dependent: :destroy
   has_many :tags, through: :tagArticles
   belongs_to :user
   accepts_nested_attributes_for :tags


   self.per_page = 2


   def self.from_article_relevant_by(article)
       correlated_art_ids = "SELECT correlated_id FROM relatartitsels
                       WHERE correlation_id = :article_id"
       where("article_id IN (#{correlated_art_ids})",
       article_id: article.id)
   end

   def self.from_article_list_by(category)
       where("category_id=:category_id", category_id: category.id)
   end

   def self.from_article_by_tagName(tag_name)
       article_ids = "select article_id from tag_articles where tag_id in (select id from tags where name like :tag_name)"
       where("id IN (#{article_ids})", tag_name: '%' + tag_name + '%')
   end

   def self.from_article_by_title(title)
       where("title like :title", title: '%' + title + '%')
   end

   def self.from_article_by_content(content)
       where("content like :content", content: '%' + content + '%')
   end



end