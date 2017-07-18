class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :updated_at
    change_column :categories, :parentId, :integer, null: false
  end
end
