class CreateRelationarticleitselves < ActiveRecord::Migration
  def change
    create_table :relatartitsel do |t|
      t.integer :correlation_id
      t.integer :correlated_id

      t.timestamps
    end
    add_index :relatartitsel, :correlation_id
    add_index :relatartitsel, :correlated_id
    add_index :relatartitsel, [:correlation_id, :correlated_id], unique: true
  end
end
