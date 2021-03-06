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

ActiveRecord::Schema.define(:version => 20121214055349) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.text     "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "alerts", :force => true do |t|
    t.string   "title"
    t.text     "message",                         :null => false
    t.datetime "expire_at"
    t.datetime "activate_at",                     :null => false
    t.string   "category",    :default => "info", :null => false
  end

  create_table "awards", :force => true do |t|
    t.integer  "player_id"
    t.integer  "badge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "award_date"
    t.datetime "expiry"
  end

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.text     "award_rule"
    t.integer  "award_rule_count", :default => 0
    t.boolean  "allow_duplicates", :default => false
    t.integer  "expire_in_days",   :default => 0
  end

  create_table "games", :force => true do |t|
    t.integer  "challenger_id",                               :null => false
    t.integer  "challenged_id",                               :null => false
    t.boolean  "complete",                 :default => false, :null => false
    t.float    "result"
    t.string   "score"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "winner_id"
    t.decimal  "challenger_rating_change"
    t.decimal  "challenged_rating_change"
  end

  add_index "games", ["challenged_id"], :name => "index_games_on_challenged_id"
  add_index "games", ["challenger_id", "challenged_id"], :name => "index_games_on_challenger_id_and_challenged_id"
  add_index "games", ["challenger_id"], :name => "index_games_on_challenger_id"
  add_index "games", ["complete"], :name => "index_games_on_complete"

  create_table "players", :force => true do |t|
    t.string   "email",                                   :default => "",    :null => false
    t.string   "encrypted_password",                      :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                                       :null => false
    t.integer  "rating",                                  :default => 1000,  :null => false
    t.boolean  "pro",                                     :default => false, :null => false
    t.boolean  "starter",                                 :default => true,  :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "changed_password",                        :default => false, :null => false
    t.boolean  "wants_challenge_completed_notifications", :default => true,  :null => false
    t.boolean  "active",                                  :default => true,  :null => false
    t.string   "authentication_token",                    :default => "",    :null => false
  end

  add_index "players", ["active"], :name => "index_players_on_active"
  add_index "players", ["authentication_token"], :name => "index_players_on_authentication_token", :unique => true
  add_index "players", ["confirmation_token"], :name => "index_players_on_confirmation_token", :unique => true
  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

end
