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

ActiveRecord::Schema[7.0].define(version: 15) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "conversations", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "user_1", null: false
    t.uuid "user_2", null: false
    t.timestamptz "created_at"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_attendees", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "event_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["event_id"], name: "index_event_attendees_on_event_id"
    t.index ["user_id"], name: "index_event_attendees_on_user_id"
  end

  create_table "event_enquiries", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text "message"
    t.uuid "user_id", null: false
    t.uuid "event_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["event_id"], name: "index_event_enquiries_on_event_id"
    t.index ["user_id"], name: "index_event_enquiries_on_user_id"
  end

  create_table "events", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.timestamptz "date"
    t.bigint "county_id", null: false
    t.uuid "user_id", null: false
    t.string "location"
    t.text "poster_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_events_on_county_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "interests", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "leader_uploads", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "upload_url"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_leader_uploads_on_user_id"
  end

  create_table "messages", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "conversation_id", null: false
    t.text "content", null: false
    t.uuid "sender_id", null: false
    t.timestamptz "created_at"
  end

  create_table "notifications", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "user_from_id", null: false
    t.uuid "user_to_id", null: false
    t.string "message", limit: 255, null: false
    t.string "status", limit: 255, default: "unread"
    t.timestamptz "created_at"
    t.string "redirect_url", limit: 255
    t.string "notification_type", limit: 255
  end

  create_table "petition_signatures", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "petition_id", null: false
    t.uuid "user_id", null: false
    t.text "reason_for_signing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_petition_signatures_on_petition_id"
    t.index ["user_id"], name: "index_petition_signatures_on_user_id"
  end

  create_table "petitions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "topic"
    t.uuid "user_id", null: false
    t.string "petition_poster"
    t.integer "target_signatures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.integer "points", null: false
    t.string "point_type", limit: 255
    t.string "desription", limit: 255
    t.timestamptz "created_at"
  end

  create_table "poll_options", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "poll_id", null: false
    t.string "option"
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "poll_votes", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "poll_id", null: false
    t.uuid "user_id", null: false
    t.uuid "poll_option_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["poll_id"], name: "index_poll_votes_on_poll_id"
    t.index ["poll_option_id"], name: "index_poll_votes_on_poll_option_id"
    t.index ["user_id"], name: "index_poll_votes_on_user_id"
  end

  create_table "polls", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "question"
    t.datetime "end_date"
    t.uuid "user_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "reviews", id: :uuid, default: nil, force: :cascade do |t|
    t.text "content", null: false
    t.decimal "rating", default: "0.0", null: false
    t.string "category", limit: 255
    t.uuid "reviewer_id", null: false
    t.uuid "leader_id", null: false
    t.timestamptz "createdAt", null: false
    t.timestamptz "updatedAt", null: false
  end

  create_table "ticket_replies", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "ticket_id", null: false
    t.uuid "user_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["ticket_id"], name: "index_ticket_replies_on_ticket_id"
    t.index ["user_id"], name: "index_ticket_replies_on_user_id"
  end

  create_table "tickets", id: :uuid, default: nil, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "ticket_no", limit: 255, null: false
    t.text "description", null: false
    t.uuid "user_id", null: false
    t.uuid "assigned_leader_id"
    t.string "category", limit: 255
    t.string "priority", limit: 255, default: "medium"
    t.string "status", limit: 255, default: "pending"
    t.timestamptz "createdAt", null: false
    t.timestamptz "updatedAt", null: false
  end

  create_table "user_titles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "user", null: false
    t.string "title", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["user_id"], name: "index_user_titles_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name", null: false
    t.string "username"
    t.string "contact", null: false
    t.string "national_id"
    t.string "gender"
    t.date "date_of_birth"
    t.string "user_uid"
    t.string "occupation"
    t.string "title_description"
    t.string "member_type"
    t.string "interests"
    t.string "country"
    t.string "location"
    t.integer "county_id"
    t.string "ward"
    t.integer "role"
    t.string "elected_position"
    t.string "profile_image"
    t.string "password_digest"
    t.boolean "verified"
    t.boolean "active", default: true
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conversations", "users", column: "user_1", name: "conversations_user_1_fkey"
  add_foreign_key "conversations", "users", column: "user_2", name: "conversations_user_2_fkey"
  add_foreign_key "event_attendees", "events"
  add_foreign_key "event_attendees", "users"
  add_foreign_key "event_enquiries", "events"
  add_foreign_key "event_enquiries", "users"
  add_foreign_key "events", "counties"
  add_foreign_key "events", "users"
  add_foreign_key "interests", "users"
  add_foreign_key "leader_uploads", "users"
  add_foreign_key "messages", "conversations", name: "messages_conversation_id_fkey"
  add_foreign_key "messages", "users", column: "sender_id", name: "messages_sender_id_fkey"
  add_foreign_key "notifications", "users", column: "user_from_id", name: "notifications_user_from_id_fkey"
  add_foreign_key "notifications", "users", column: "user_to_id", name: "notifications_user_to_id_fkey"
  add_foreign_key "petition_signatures", "petitions"
  add_foreign_key "petition_signatures", "users"
  add_foreign_key "petitions", "users"
  add_foreign_key "points", "users", name: "points_user_id_fkey"
  add_foreign_key "poll_options", "polls"
  add_foreign_key "poll_votes", "poll_options"
  add_foreign_key "poll_votes", "polls"
  add_foreign_key "poll_votes", "users"
  add_foreign_key "polls", "users"
  add_foreign_key "reviews", "users", column: "leader_id", name: "reviews_leader_id_fkey"
  add_foreign_key "reviews", "users", column: "reviewer_id", name: "reviews_reviewer_id_fkey"
  add_foreign_key "ticket_replies", "tickets"
  add_foreign_key "ticket_replies", "users"
  add_foreign_key "tickets", "users", column: "assigned_leader_id", name: "tickets_assigned_leader_id_fkey"
  add_foreign_key "tickets", "users", name: "tickets_user_id_fkey"
  add_foreign_key "user_titles", "users"
end
