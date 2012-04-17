# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120417203226) do

  create_table "bookmarks", :force => true do |t|
    t.string   "type"
    t.string   "uuid"
    t.string   "title"
    t.string   "original_url"
    t.string   "remote_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks_patrons", :id => false, :force => true do |t|
    t.string "bookmark_id"
    t.string "patron_id"
  end

  create_table "patrons", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_number"
    t.string   "password"
    t.string   "bio"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
