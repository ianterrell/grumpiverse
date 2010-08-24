class AddTokenAndSecretToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :twitter_token, :string
    add_column :characters, :twitter_secret, :string
  end

  def self.down
    remove_column :characters, :twitter_secret
    remove_column :characters, :twitter_token
  end
end
