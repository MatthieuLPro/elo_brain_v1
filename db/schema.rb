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

ActiveRecord::Schema.define(version: 2020_12_29_205713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elos", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id"
    t.integer "level", default: 1200, null: false
    t.index ["match_id"], name: "index_elos_on_match_id"
    t.index ["player_id"], name: "index_elos_on_player_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "winner_id", null: false
    t.bigint "looser_id", null: false
    t.index ["event_id"], name: "index_matches_on_event_id"
    t.index ["looser_id"], name: "index_matches_on_looser_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
  end

end
