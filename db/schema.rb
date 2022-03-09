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

ActiveRecord::Schema[7.0].define(version: 2022_03_09_145510) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.bigint "deck_id", null: false
    t.string "unit"
    t.float "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "owner"
    t.datetime "opened", precision: nil
    t.datetime "closed", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deck_id"
    t.index ["deck_id"], name: "index_rooms_on_deck_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "started", precision: nil
    t.datetime "finished", precision: nil
    t.string "started_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_rounds_on_room_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "round_id", null: false
    t.bigint "card_id", null: false
    t.string "user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_votes_on_card_id"
    t.index ["round_id"], name: "index_votes_on_round_id"
  end

  add_foreign_key "rooms", "decks"
  add_foreign_key "rounds", "rooms"
end
