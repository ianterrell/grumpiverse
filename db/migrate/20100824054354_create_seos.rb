class CreateSeos < ActiveRecord::Migration
  def self.up
    create_table :seos do |t|
      t.string :title, :keywords, :description
      t.timestamps
    end
    remove_column :pages, :title
    remove_column :pages, :keywords
    remove_column :pages, :description
    add_column :pages, :seo_id, :integer
    add_column :articles, :seo_id, :integer
    add_column :characters, :seo_id, :integer
  end

  def self.down
    remove_column :characters, :seo_id
    remove_column :articles, :seo_id
    remove_column :pages, :seo_id
    add_column :pages, :description, :text
    add_column :pages, :keywords, :string
    add_column :pages, :title, :string
    drop_table :seos
  end
end
