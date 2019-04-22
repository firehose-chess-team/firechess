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

ActiveRecord::Schema.define(version: 20190417073118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "white_player_id"
    t.integer  "black_player_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "player_id"
    t.integer  "game_id"
    t.string   "type_id"
    t.string   "type"
    t.string   "piece_color"
    t.index ["game_id"], name: "index_pieces_on_game_id", using: :btree
    t.index ["piece_color"], name: "index_pieces_on_piece_color", using: :btree
    t.index ["player_id"], name: "index_pieces_on_player_id", using: :btree
    t.index ["position_x"], name: "index_pieces_on_position_x", using: :btree
    t.index ["position_y"], name: "index_pieces_on_position_y", using: :btree
    t.index ["type"], name: "index_pieces_on_type", using: :btree
    t.index ["type_id"], name: "index_pieces_on_type_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
