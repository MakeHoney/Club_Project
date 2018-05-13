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

ActiveRecord::Schema.define(version: 20180509103551) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_clubs", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_clubs_on_category_id"
    t.index ["club_id"], name: "index_category_clubs_on_club_id"
  end

  create_table "cateogry_clubs", force: :cascade do |t|
    t.integer  "club_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_cateogry_clubs_on_category_id"
    t.index ["club_id"], name: "index_cateogry_clubs_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.text     "short_desc"
    t.text     "detail_desc"
    t.text     "meeting_date"
    t.string   "contact"
    t.string   "room_location"
    t.integer  "isApply"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "applyMethod"
    t.index ["category_id"], name: "index_clubs_on_category_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.integer  "isMain"
    t.text     "desc"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_photos_on_club_id"
  end

end
