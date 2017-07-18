class RenameRelatartitselToHass < ActiveRecord::Migration
  def change
    rename_table :relatartitsel, :relatartitsels
  end
end
