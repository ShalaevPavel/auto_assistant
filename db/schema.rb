ActiveRecord::Schema[7.0].define(version: 2023_05_14_181134) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "fuel_type"
    t.integer "engine_size"
    t.string "transmission"
    t.string "body_type"
    t.integer "mileage"
    t.text "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "oil_change"
    t.datetime "water_removal"
    t.datetime "cabin_filter_change"
    t.datetime "breaks_liquid_change"
    t.datetime "freeze_liquid_change"
    t.datetime "driving_belt_change"
    t.datetime "chain_grm_change"
    t.datetime "oil_filter_change"
    t.datetime "air_filter_change"
    t.string "registration_number"
    t.datetime "ensuranse_expiration"
    t.datetime "driver_lisence_expiration"
    t.datetime "inspection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "service_type", default: [], array: true
    t.string "contact"
  end

  create_table "taggables", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_id"
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.boolean "request_service_owner", default: false
    t.boolean "permission_to_become_service_owner", default: false
    t.bigint "service_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_users_on_service_id"
  end

  add_foreign_key "taggables", "tags"
  add_foreign_key "users", "services"
end
