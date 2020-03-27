# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_27_155532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.integer "plot"
    t.integer "total_no_of_episode"
    t.integer "season_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "price", precision: 3, scale: 2, default: "2.99"
    t.string "video_quality"
    t.bigint "video_content_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "voucher_id"
    t.string "voucher_number"
    t.index ["user_id"], name: "index_purchases_on_user_id"
    t.index ["video_content_id"], name: "index_purchases_on_video_content_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "video_contents", force: :cascade do |t|
    t.string "title"
    t.integer "plot"
    t.integer "number"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vouchers", force: :cascade do |t|
    t.string "voucher_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "used", default: false
  end

  add_foreign_key "purchases", "users"
  add_foreign_key "purchases", "video_contents"
end
