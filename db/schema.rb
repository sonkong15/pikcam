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

ActiveRecord::Schema.define(:version => 20130325050217) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.text     "description"
    t.string   "slug"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "categorizations", :force => true do |t|
    t.integer  "upload_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categorizations", ["upload_id", "category_id"], :name => "index_categorizations_on_upload_id_and_category_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "flaggings", :force => true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flaggings"

  create_table "funny_videos", :force => true do |t|
    t.string   "title"
    t.string   "youtube"
    t.text     "youtube_html"
    t.text     "dailymotion"
    t.text     "dailymotion_html"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "dailymotionid"
    t.text     "youtubeid"
    t.string   "slug"
    t.text     "facebook"
    t.text     "facebook_html"
    t.string   "facebook_id"
  end

  add_index "funny_videos", ["slug"], :name => "index_funny_videos_on_slug", :unique => true

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "site"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "picture_file_size"
    t.string   "picture_content_type"
    t.string   "picture_file_name"
    t.datetime "picture_updated_at"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "private",              :default => false
    t.text     "description"
  end

  add_index "uploads", ["user_id"], :name => "index_uploads_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "perishable_token"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.string   "website_link"
    t.string   "facebook_link"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "facebook_uid"
    t.string   "twitter_uid"
    t.string   "image_url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false, :null => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
