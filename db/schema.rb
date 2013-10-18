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

ActiveRecord::Schema.define(:version => 20131018065735) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "company_members", :force => true do |t|
    t.integer  "user_id"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "company_members", ["user_id"], :name => "index_company_members_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
  end

  add_index "pages", ["ancestry"], :name => "index_pages_on_ancestry"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "cover"
    t.text     "short_text"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "project_members", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "role"
    t.string   "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_members", ["project_id"], :name => "index_project_members_on_project_id"
  add_index "project_members", ["user_id"], :name => "index_project_members_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "short_description"
    t.text     "description"
    t.string   "visibility"
    t.string   "status"
    t.string   "cover"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "slides", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "upload_id"
    t.string   "link_title"
    t.string   "link"
    t.string   "layout"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "support_messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "support_messages", ["user_id"], :name => "index_support_messages_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_lists", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "task_lists", ["project_id"], :name => "index_task_lists_on_project_id"
  add_index "task_lists", ["user_id"], :name => "index_task_lists_on_user_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "task_list_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "tasks", ["task_list_id"], :name => "index_tasks_on_task_list_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.string   "file_type"
    t.text     "legend"
    t.string   "file"
    t.integer  "user_id"
    t.string   "visibility"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "uploads", ["user_id"], :name => "index_uploads_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "blogger"
    t.boolean  "admin"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "website"
    t.string   "facebook"
    t.string   "github"
    t.string   "linkedin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
