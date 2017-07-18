class AddCategoryIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer, default: 0, null: false
  end
end
