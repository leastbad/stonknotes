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

ActiveRecord::Schema.define(version: 2021_03_07_165918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stonknote_hashtags", force: :cascade do |t|
    t.integer "stonknote_id"
    t.string "tag", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stonknote_id", "tag"], name: "index_stonknote_hashtags_on_stonknote_id_and_tag", unique: true
  end

  create_table "stonknote_tickers", force: :cascade do |t|
    t.integer "stonknote_id"
    t.string "ticker_symbol", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ticker_symbol"], name: "index_ticker_symbols_on_stocktwit_tickers"
  end

  create_table "stonknote_watch_tickers", force: :cascade do |t|
    t.string "ticker_symbol", limit: 255
    t.boolean "watching"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ticker_symbol"], name: "index_stonknote_watch_tickers_on_ticker_symbol", unique: true
  end

  create_table "stonknotes", force: :cascade do |t|
    t.integer "stocktwit_id"
    t.datetime "stonknote_time"
    t.string "stocktwit_url", limit: 255
    t.string "symbol", limit: 255
    t.text "message"
    t.string "image_thumb_url", limit: 255
    t.string "image_large_url", limit: 255
    t.string "image_original_url", limit: 255
    t.boolean "hide"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "call_result"
    t.string "note"
    t.date "stonknote_date"
    t.string "image_cropped_url"
    t.index ["stonknote_date"], name: "index_stonknotes_on_stonknote_date"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "twitter_message_id"
    t.string "message"
    t.string "local_image_url"
    t.datetime "posted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stonknote_id"
  end

end
