class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    add_index :users, :remember_token
    remove_column :users, :password
  end

end
