# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_30_135746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.float "latitude", default: 0.0
    t.float "longitude", default: 0.0
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name"
    t.index ["zipcode"], name: "index_cities_on_zipcode"
  end

  create_table "climbing_centers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude", default: 0.0
    t.float "longitude", default: 0.0
    t.text "hours"
    t.string "image_url"
    t.integer "size"
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.string "twitter"
    t.string "phone"
    t.string "email"
    t.boolean "wifi"
    t.boolean "restaurant"
    t.boolean "pub"
    t.text "restaurant_pub_hours"
    t.boolean "sauna"
    t.boolean "hammam"
    t.boolean "workout_space"
    t.boolean "yoga_classes"
    t.boolean "shop"
    t.float "standard_entry"
    t.float "standard_entry_reduced"
    t.float "standard_entry_under_twelve"
    t.float "standard_entry_under_five"
    t.float "standard_entry_under_six"
    t.float "happy_hours_entry"
    t.float "happy_hours_entry_reduced"
    t.float "ten_entries"
    t.float "ten_entries_reduced"
    t.float "ten_entries_happy_hours"
    t.float "ten_entries_happy_hours_reduced"
    t.float "ten_entries_under_twelve"
    t.float "ten_entries_under_six"
    t.float "ten_entries_under_five"
    t.float "yearly_subscription"
    t.float "yearly_subscription_reduced"
    t.float "yearly_subscription_couple"
    t.float "yearly_subscription_couple_reduced"
    t.float "yearly_subscription_child"
    t.float "yearly_subscription_one_center"
    t.float "yearly_subscription_reduced_one_center"
    t.float "yearly_subscription_one_center_under_twelve"
    t.float "yearly_subscription_happy_hours"
    t.float "monthly_subscription"
    t.float "monthly_subscription_reduced"
    t.float "monthly_subscription_happy_hours"
    t.float "monthly_subscription_couple"
    t.float "monthly_subscription_couple_reduced"
    t.float "monthly_subscription_child"
    t.float "monthly_subscription_reduced_happy_hours"
    t.float "yearly_subscription_reduced_happy_hours"
    t.text "conditions"
    t.boolean "climbing_wall"
    t.string "url"
    t.float "climbing_shoes"
    t.float "climbing_shoes_reduced"
    t.integer "average_ambiance"
    t.integer "average_cleanliness"
    t.integer "average_service"
    t.integer "average_route"
    t.integer "average_total_rating"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_climbing_centers_on_city_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "climbing_center_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climbing_center_id"], name: "index_comments_on_climbing_center_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "climbing_center_id"
    t.integer "ambiance"
    t.integer "cleanliness"
    t.integer "service"
    t.integer "route"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climbing_center_id"], name: "index_ratings_on_climbing_center_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_admin", default: false
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "climbing_centers"
  add_foreign_key "comments", "users"
end
