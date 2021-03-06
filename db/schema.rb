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

ActiveRecord::Schema.define(version: 20151223063021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "collections_photos", id: false, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "photo_id",      null: false
  end

  add_index "collections_photos", ["collection_id", "photo_id"], name: "index_collections_photos_on_collection_id_and_photo_id", unique: true, using: :btree
  add_index "collections_photos", ["collection_id"], name: "index_collections_photos_on_collection_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "media_url"
    t.string   "link"
    t.string   "media_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "posted_date"
  end

end
