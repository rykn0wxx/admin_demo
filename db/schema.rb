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

ActiveRecord::Schema.define(version: 20170910130711) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dim_desks", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.integer "support_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dim_times", force: :cascade do |t|
    t.decimal "dt_num"
    t.time "dt_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_phones", force: :cascade do |t|
    t.integer "dim_time_id"
    t.integer "project_id"
    t.integer "language_id"
    t.integer "timezone_id"
    t.datetime "record_date"
    t.integer "calls_off", default: 0, null: false
    t.integer "calls_ans", default: 0, null: false
    t.integer "calls_wsl", default: 0, null: false
    t.integer "calls_abn", default: 0, null: false
    t.integer "calls_a30", default: 0, null: false
    t.integer "time_talk", default: 0, null: false
    t.integer "time_hold", default: 0, null: false
    t.integer "time_wrap", default: 0, null: false
    t.integer "queue_ans", default: 0, null: false
    t.integer "queue_max", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dim_time_id"], name: "index_fact_phones_on_dim_time_id"
    t.index ["language_id"], name: "index_fact_phones_on_language_id"
    t.index ["project_id"], name: "index_fact_phones_on_project_id"
    t.index ["timezone_id"], name: "index_fact_phones_on_timezone_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "region_id"
    t.integer "client_id"
    t.integer "dim_desk_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_groups_on_client_id"
    t.index ["dim_desk_id"], name: "index_groups_on_dim_desk_id"
    t.index ["region_id"], name: "index_groups_on_region_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.integer "region_id"
    t.string "name"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_languages_on_region_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "region_id"
    t.integer "client_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["region_id"], name: "index_projects_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_levels", force: :cascade do |t|
    t.integer "dim_desk_id"
    t.string "name"
    t.text "description", default: "", null: false
    t.text "definition", default: "", null: false
    t.float "weighting", default: 0.0
    t.text "measurement", default: ""
    t.text "calculation", default: ""
    t.float "sla_target", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dim_desk_id"], name: "index_service_levels_on_dim_desk_id"
  end

  create_table "ticket_slas", force: :cascade do |t|
    t.integer "service_level_id"
    t.integer "ticket_type_id"
    t.integer "contact_type_id"
    t.integer "priority_id"
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "actual_duration", default: 0
    t.integer "business_duration", default: 0
    t.integer "actual_pause", default: 0
    t.integer "business_pause", default: 0
    t.string "sla_stage"
    t.string "location_city"
    t.string "location_zip"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_type_id"], name: "index_ticket_slas_on_contact_type_id"
    t.index ["priority_id"], name: "index_ticket_slas_on_priority_id"
    t.index ["service_level_id"], name: "index_ticket_slas_on_service_level_id"
    t.index ["ticket_type_id"], name: "index_ticket_slas_on_ticket_type_id"
    t.index ["user_id"], name: "index_ticket_slas_on_user_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timezones", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "username", default: "", null: false
    t.string "snow_user", default: "", null: false
    t.string "phone_user", default: "", null: false
    t.string "quality_user", default: "", null: false
    t.boolean "isadmin", default: false, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
