class AddCachedSlugs < ActiveRecord::Migration
  def self.up
    add_column :articles, :cached_slug, :string
    add_column :characters, :cached_slug, :string
    remove_column :characters, :slug
  end

  def self.down
    add_column :characters, :slug, :string
    remove_column :characters, :cached_slug
    remove_column :articles, :cached_slug
  end
end
