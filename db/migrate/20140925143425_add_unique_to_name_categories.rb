class AddUniqueToNameCategories < ActiveRecord::Migration
  def change
    change_column :categories, :name, :string, unique: true
  end
end
