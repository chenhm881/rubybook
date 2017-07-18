class CreateTagArticles < ActiveRecord::Migration
  def change
    create_table :tag_articles do |t|
      t.integer :tag_id
      t.integer :article_id
      t.integer :active_count

      t.timestamps
    end
  end
end
