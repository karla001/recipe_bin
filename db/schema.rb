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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161101202749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.float    "portion"
    t.string   "p_unit_of_measure"
    t.string   "brand"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "recipe_id"
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instruction"
    t.integer  "feeds"
    t.string   "image"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_recipes", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "recipe_id"
  end

  add_index "tags_recipes", ["recipe_id"], name: "index_tags_recipes_on_recipe_id", using: :btree
  add_index "tags_recipes", ["tag_id"], name: "index_tags_recipes_on_tag_id", using: :btree

  create_table "time_frames", force: :cascade do |t|
    t.string   "date"
    t.float    "approx_price"
    t.text     "description"
    t.boolean  "public"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "tagline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "tags_recipes", "recipes"
  add_foreign_key "tags_recipes", "tags"
end
