class RenameColumnParentIdToAritcle < ActiveRecord::Migration
  def change
    rename_column :categories, :parentId, :parent_id  
  end
end
