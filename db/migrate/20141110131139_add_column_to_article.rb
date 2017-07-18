class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :markdown_content, :text
  end
end
