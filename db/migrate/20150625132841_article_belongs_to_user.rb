class ArticleBelongsToUser < ActiveRecord::Migration
  def change
    add_belongs_to :articles, :user, polymorphic: true, index:true
  end
end
