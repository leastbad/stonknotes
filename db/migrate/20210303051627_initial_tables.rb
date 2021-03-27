class InitialTables < ActiveRecord::Migration[6.1]
  def change
    create_table "stocktwit_hashtags", force: :cascade do |t|
      t.integer  "stocktwit_id"
      t.string   "tag",          limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "stocktwit_hashtags", ["stocktwit_id", "tag"], name: "index_stocktwit_hashtags_on_stocktwit_id_and_tag", unique: true, using: :btree

    create_table "stocktwit_tickers", force: :cascade do |t|
      t.integer  "stocktwit_id"
      t.string   "ticker_symbol", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "stocktwit_tickers", ["ticker_symbol"], name: "index_ticker_symbols_on_stocktwit_tickers", using: :btree

    create_table "stocktwit_watch_tickers", force: :cascade do |t|
      t.string   "ticker_symbol", limit: 255
      t.boolean  "watching"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "stocktwit_watch_tickers", ["ticker_symbol"], name: "index_stocktwit_watch_tickers_on_ticker_symbol", unique: true, using: :btree

    create_table "stocktwits", force: :cascade do |t|
      t.integer  "stocktwit_id"
      t.datetime "stocktwit_time"
      t.string   "stocktwit_url",        limit: 255
      t.string   "symbol",               limit: 255
      t.text     "message"
      t.string   "image_thumb_url",      limit: 255
      t.string   "image_large_url",      limit: 255
      t.string   "image_original_url",   limit: 255
      t.boolean  "hide"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "stocktwits_user_name", limit: 255
      t.integer  "call_result"
      t.string   "note"
      t.date     "stocktwit_date"
      t.string   "image_cropped_url"
    end

    add_index "stocktwits", ["stocktwit_date"], name: "index_stocktwits_on_stocktwit_date", using: :btree

    create_table "tweets", force: :cascade do |t|
      t.integer  "twitter_message_id", limit: 8
      t.string   "message"
      t.string   "local_image_url"
      t.datetime "posted_at"
      t.datetime "created_at",                   null: false
      t.datetime "updated_at",                   null: false
      t.integer  "stocktwit_id"
    end
  end
end
