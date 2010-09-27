class AddPositionToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :position, :integer, :default => 1
  end

  def self.down
    remove_column :snippets, :position
  end
end
