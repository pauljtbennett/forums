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

ActiveRecord::Schema.define(:version => 20130111145002) do

  create_table "conversations", :force => true do |t|
    t.string   "title"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "conversations", ["forum_id"], :name => "index_conversations_on_forum_id"
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forums", ["site_id"], :name => "index_forums_on_site_id"
  add_index "forums", ["user_id"], :name => "index_forums_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "posts", ["conversation_id"], :name => "index_posts_on_conversation_id"
  add_index "posts", ["post_id"], :name => "index_posts_on_post_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "username"
    t.string   "auth_token"
  end

end
