class RemoveOldModels < ActiveRecord::Migration
  def self.up
    drop_table :grams
    drop_table :pages
    drop_table :seos
    drop_table :snippets
    drop_table :tweets
    drop_table :comics
  end

  def self.down
    create_table "comics", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.string   "alt_text"
    end

    create_table "tweets", :force => true do |t|
      t.integer  "character_id"
      t.string   "tweet"
      t.datetime "scheduled_for_publication_at"
      t.datetime "tweeted_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "delayed_job_id"
      t.string   "status_id"
      t.integer  "in_reply_to_id"
    end
    create_table "snippets", :force => true do |t|
      t.string   "name"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position",   :default => 1
    end
    create_table "seos", :force => true do |t|
      t.string   "title"
      t.string   "keywords"
      t.string   "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "pages", :force => true do |t|
      t.string   "slug"
      t.text     "body"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "seo_id"
    end
    create_table "grams", :force => true do |t|
      t.integer  "character_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end
end
