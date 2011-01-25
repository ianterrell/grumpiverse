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

ActiveRecord::Schema.define(:version => 20110125052801) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.text     "svg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.datetime "scheduled_for_publication_at"
    t.datetime "published_at"
    t.integer  "delayed_job_id"
    t.string   "rendering_file_name"
    t.string   "rendering_content_type"
    t.integer  "rendering_file_size"
    t.datetime "rendering_updated_at"
    t.integer  "left_character_id"
    t.integer  "right_character_id"
    t.integer  "height",                       :default => 600
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

  create_table "speech_bubbles", :force => true do |t|
    t.integer  "comic_id"
    t.string   "words",              :limit => 1024
    t.decimal  "vertical_padding",                   :precision => 3, :scale => 2
    t.decimal  "horizontal_padding",                 :precision => 3, :scale => 2
    t.integer  "vertical_offset"
    t.integer  "horizontal_offset"
    t.integer  "tip_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
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
