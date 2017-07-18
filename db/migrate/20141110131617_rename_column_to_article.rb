class RenameColumnToArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :markdown_content, :content_markdown  
  end
end
