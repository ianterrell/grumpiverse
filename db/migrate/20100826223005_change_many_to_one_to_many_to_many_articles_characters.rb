class ChangeManyToOneToManyToManyArticlesCharacters < ActiveRecord::Migration
  def self.up
    remove_column :articles, :author_id
    remove_column :articles, :type
    
    create_table :articles_characters, :id => false do |t|
      t.integer :article_id, :character_id
    end
    add_index :articles_characters, :article_id
    add_index :articles_characters, :character_id
  end

  def self.down
    remove_index :articles_characters, :character_id
    remove_index :articles_characters, :article_id
    add_column :articles, :type, :string
    add_column :articles, :author_id, :integer
  end
end
