# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100914200908) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.datetime "scheduled_for_publication_at"
    t.datetime "published_at"
    t.integer  "delayed_job_id"
    t.integer  "main_comic_id"
    t.integer  "seo_id"
    t.boolean  "favorite"
  end

  create_table "articles_characters", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "character_id"
  end

  add_index "articles_characters", ["article_id"], :name => "index_articles_characters_on_article_id"
  add_index "articles_characters", ["character_id"], :name => "index_articles_characters_on_character_id"

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "twitter_handle"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "short_description"
    t.integer  "seo_id"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.string   "gram_file_name"
    t.string   "gram_content_type"
    t.integer  "gram_file_size"
    t.datetime "gram_updated_at"
  end

  create_table "comics", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "alt_text"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grams", :force => true do |t|
    t.integer  "character_id"
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

  create_table "seos", :force => true do |t|
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "tweets", :force => true do |t|
    t.integer  "character_id"
    t.string   "tweet"
    t.datetime "scheduled_for_publication_at"
    t.datetime "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delayed_job_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
