class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :author_id
      t.string :title, :author_type, :type
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
